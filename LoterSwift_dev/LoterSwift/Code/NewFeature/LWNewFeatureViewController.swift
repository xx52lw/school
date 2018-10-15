//
//  LWFeatureViewController.swift
//  LoterSwift
//
//  Created by 张星星 on 2018/4/8.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
// ==================================================================================================================
/// 新特性界面视图控制器
class LWNewFeatureViewController: LWBaseViewController {
    /// 滚动视图
    //MARK:  滚动视图
    lazy var scrollerView: UIScrollView = {
        let view = UIScrollView.init(frame: self.view.bounds)
        view.backgroundColor = UIColor.clear
        view.bounces = false
        view.isPagingEnabled = true
        view.delegate = self
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    /// 遮盖按钮
    //MARK:  遮盖按钮
    lazy var coverBtn: UIButton = {
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = self.view.bounds
        btn.backgroundColor = UIColor.clear
        btn.isHidden = true
        btn.addTarget(self, action: #selector(self.coverBtnClick(btn:)), for: UIControl.Event.touchUpInside)
        return btn
    }()

    //MARK: 隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //MARK: - 重写viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addViewSubviews()
        doScrollView()
    }
    //MARK: - 重写viewWillLayoutSubviews
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutViewSubviews()
    }
}
// ==================================================================================================================
/// 新特性界面视图控制器工具方法
extension LWNewFeatureViewController {
    /// 添加子控件
    //MARK: - 添加子控件
    func addViewSubviews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.scrollerView)
        self.view.addSubview(self.coverBtn)
    }
    ///布局子控件
    //MARK: - 布局子控件
    func layoutViewSubviews() {
        
    }
    /// 处理视图
    //MARK:  处理视图
    func doScrollView() {
        let featureImageCount = LWAppConfigurationModel.sharedInstance().featureImageCount
        let count : Int = Int(featureImageCount)!
        var x : CGFloat = 0.0
        let y : CGFloat = 0.0
        let w : CGFloat = self.scrollerView.frame.size.width
        let h : CGFloat = self.scrollerView.frame.size.height
        if count > 0 && count < 100 {
            for i in 0..<count {
                x = w * CGFloat(i)
                let imageView = UIImageView.init(frame:CGRect.init(x: x, y: y, width: w, height: h))
                imageView.backgroundColor = UIColor.clear
                imageView.isUserInteractionEnabled = false
                let image = UIImage.init(named: "newFeature_\(i+1)")
                imageView.image = image
                self.scrollerView.addSubview(imageView)
            }
        }
        self.scrollerView.contentSize = CGSize.init(width: w * CGFloat(count), height: h)
    }
    /// 覆盖按钮点击
    //MARK:  覆盖按钮点击
    @objc func coverBtnClick(btn : UIButton) {
        LWPOSTNotification(NotificationName: LWSelectIntoAppControllerNotification)
    }
}
// ==================================================================================================================
/// 新特性界面视图控制器代理
extension LWNewFeatureViewController : UIScrollViewDelegate {
    /// 视图结束轮动
    //MARK:  视图结束轮动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contextOffsetX = scrollView.contentOffset.x
        if contextOffsetX > (self.scrollerView.contentSize.width - self.scrollerView.frame.size.width - 10) { // 停留在最后一页(加一个容错值）
            self.coverBtn.isHidden = false
        }
        else {
            self.coverBtn.isHidden = true
        }
    }
}
// ==================================================================================================================
