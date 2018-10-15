//
//  LWHomeViewController.swift
//  Loter-swift
//
//  Created by 张星星 on 2018/4/2.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
//================================================================================================================================
///MARK: 首页视图控制器
class LWHomeViewController: LWBaseViewController {
    
    /// 列表视图
    lazy var tableView : UITableView = {
        let view = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
        view.backgroundColor = UIColor.red
        return view
    }()
    //MARK: - 重写viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addViewSubviews()
        
    }
    //MARK: - 重写viewWillLayoutSubviews
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutViewSubviews()
    }
}
//================================================================================================================================
///MARK: 首页视图控制器
extension LWHomeViewController {

    //MARK: - 添加子控件
    func addViewSubviews() {
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.requestData()
        })
        view.addSubview(tableView)
    }
    //MARK: - 布局子控件
    func layoutViewSubviews() {
        tableView.frame = view.bounds
    }
    /// 获取数据
    @objc func requestData()  {
        tableView.mj_header.endRefreshing()
       LWProgressHUD.show(infoStr: "正在加载。。。")
        LWNetWorkingTool<LWCommonConfigModel>.getDataFromeServiceRequest(url: kURLAppCommonConfig, successBlock: { jsonModel  in
            LWProgressHUD.dismiss()
            print(jsonModel?.servicePhone! as Any)
        }) { (error) in
            LWProgressHUD.dismiss()
        }
    }
}
//================================================================================================================================

