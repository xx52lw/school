//
//  LWNetWorkingTool.swift
//  Loter-swift
//
//  Created by 张星星 on 2018/3/30.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
// ==================================================================================================================
/// 对网络请求的再次封装
class LWNetWorkingTool<T:HandyJSON >: NSObject {
    /**
     上传图片服务器数据，并转化为模型（对Alamofire进一步封装
     - parameter url:          url地址
     - parameter params:       请求参数
     - parameter keyPath:      需要转模型的数据字段
     - parameter successBlock: 成功回调
     - parameter errorBlock:   失败回调
     - parameter errorBlock:   失败回调
     */
    //MARK: - 上传图片服务器数据
    class  func uploadImagesRequest(url: String, params:[String: Any]? = nil, imageDatas: [Data] ,imageNames: [String] , uploadProgresBlock: @escaping (_ uploadProgress: Progress) -> Void, successBlock: @escaping (_ result: T?) -> Void, errorBlock: @escaping (_ error: NSError) -> Void) {
        
        let urlString = kUrlBase + url
         Alamofire.upload(multipartFormData: { (multipartFormData) in
             let count = min(imageDatas.count, imageNames.count)
             for index in 0..<count {
                 let data = imageDatas[index]
                 let name = imageNames[index]
                 let fileName = name + ".png"
                 multipartFormData.append(data, withName: name, fileName: fileName, mimeType: "image/png")
             }
            for (key,value) in params! {
                multipartFormData.append(((value as AnyObject).data(using: String.Encoding.utf8.rawValue))!, withName: key)
            }
         }, to: urlString)
         { (encodingCompletion) in
             switch encodingCompletion {
                 case .success(let upload, _, _):
                     //连接服务器成功后，对json的处理
                    upload.responseString(completionHandler: { response in
                        doResponseObject(dataResponse: response, successBlock: successBlock, errorBlock: errorBlock)
                    })
                     upload.responseJSON { response in
                     //解包
                     }
                     //获取上传进度
                     upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                     print("图片上传进度: \(progress.fractionCompleted)")
                 }
                 case .failure(let err):
                 errorBlock(err as NSError)
            }
         }
    }
    
    /**
     获取服务器数据，并转化为模型（对Alamofire进一步封装） GET请求
     - parameter url:          url地址
     - parameter params:       请求参数
     - parameter keyPath:      需要转模型的数据字段
     - parameter successBlock: 成功回调
     - parameter errorBlock:   失败回调
     */
    //MARK: - 获取服务器数据，并转化为模型（对Alamofire进一步封装） GET请求
  class  func getDataFromeServiceRequest(url: String, params:[String: Any]? = nil, successBlock: @escaping (_ result: T?) -> Void, errorBlock: @escaping (_ error: NSError) -> Void) {
    
        let urlString = kUrlBase + url
    
        Alamofire.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default).responseString  {
            response in
            doResponseObject(dataResponse: response, successBlock: successBlock, errorBlock: errorBlock)
        }
    }
    /**
     获取服务器数据，并转化为模型（对Alamofire进一步封装） POST请求
     - parameter url:          url地址
     - parameter params:       请求参数
     - parameter keyPath:      需要转模型的数据字段
     - parameter successBlock: 成功回调
     - parameter errorBlock:   失败回调
     */
    //MARK: - 获取服务器数据，并转化为模型（对Alamofire进一步封装） POST请求
    class  func postDataFromeServiceRequest(url: String, params:[String: Any]? = nil, successBlock: @escaping (_ result: T?) -> Void, errorBlock: @escaping (_ error: NSError) -> Void) {
        let urlString = kUrlBase + url
        Alamofire.request(urlString, method: .post, parameters: params, encoding: URLEncoding.default).responseString  {
            response in
            doResponseObject(dataResponse: response, successBlock: successBlock, errorBlock: errorBlock)
        }
        
    }
    /// 处理请求返回数据
    //MARK: - 处理请求返回数据
    private class  func doResponseObject(dataResponse: DataResponse<String>, successBlock: @escaping (_ result: T?) -> Void, errorBlock: @escaping (_ error: NSError) -> Void) {
        if let err = dataResponse.result.error {
            errorBlock(err as NSError)
        }
        else {
            guard let jsonString = dataResponse.result.value else {
                doError(domain: "网络异常", errorCode: 999, errorBlock: errorBlock)
                return
            }
            if let err = dataResponse.result.error {
                errorBlock(err as NSError)
            }
            else {
                let baseModel = JSONDeserializer<LWBaseModel>.deserializeFrom(json: jsonString)
                if baseModel?.code == 1 {
                    print(jsonString)
                    let jsonModel = JSONDeserializer<T>.deserializeFrom(json: jsonString, designatedPath: "data")
                    successBlock(jsonModel)
                }
                else {
                    doError(domain: "网络异常", errorCode: 999, errorBlock: errorBlock)
                }
            }
        }
    }
    /// 处理请求返回数据
    //MARK: - 处理请求返回数据
   private class  func doError(domain: String, errorCode : Int ,errorBlock: @escaping (_ error: NSError) -> Void) {
        let err = NSError.init(domain: domain, code: errorCode, userInfo: nil)
        errorBlock(err)
    }
    /// 模型转字典
    //MARK: - 模型转字典
    class func getDictinoary(model : HandyJSON) -> Dictionary<String, Any>? {
        guard let dict = model.toJSON() else {
            return  Dictionary()
        }
        return dict
    }
    /// 字典转模型
    //MARK: - 字典转模型
    class func getModel(dict : Dictionary<String, Any>?) -> T {
        guard let model = T.deserialize(from: dict) else {
            return T()
        }
        return model
    }
    /// json字符串转模型
    //MARK: - json字符串转模型
    class func getModel(jsonString : String,designatedPath: String? = nil) -> T {
        guard let model = T.deserialize(from: jsonString) else {
            return T()
        }
        return model
    }
    /// 模型转json字符串
    //MARK: - 模型转json字符串
    class func getJsonString(model : HandyJSON) -> (String) {
        guard let jsonStr = model.toJSONString() else {
            return ""
        }
        return jsonStr
    }
}
// ==================================================================================================================
