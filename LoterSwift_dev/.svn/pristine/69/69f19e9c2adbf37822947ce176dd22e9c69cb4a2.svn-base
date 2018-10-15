//
//  LWUITools.swift
//  LoterSwift
//
//  Created by 张星星 on 2018/4/3.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
// ==================================================================================================================
/// UI工具方法
class LWUITools: NSObject {

    /// 测量字符串Size
    class  func sizeWithStringFont(_ string : String?, font : UIFont, maxSize : CGSize) -> CGSize {
        let str = (string ?? "") as NSString
        let option =  NSStringDrawingOptions.usesLineFragmentOrigin.rawValue | NSStringDrawingOptions.usesFontLeading.rawValue
        return str.boundingRect(with: maxSize, options: NSStringDrawingOptions(rawValue: option), attributes: [NSAttributedStringKey.font : font], context: nil).size
    }
    
}
// ==================================================================================================================
