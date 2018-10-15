//
//  LWPlazaCirclePage.swift
//  Loter-swift
//
//  Created by 张星星 on 2018/4/2.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit

class LWPlazaCirclePage: LWBaseViewController, LWBannerViewDelegate,LWTextFieldDelegate {
    

    
    
    lazy var bannerView: LWBannerView = {
        let banner = LWBannerView()
        banner.delegate = self
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        let a = 0.06
        let b = 0.02
        let tabss = LWUITools.decimalNumber(a, num2: b, operation: "/")
        print(tabss)
        
        
        

        
        
        
        let textField = LWTextField.createPlaceholderTextField(CGRect.init(x: 20, y: 300, width: 200, height: 20), placeholderString: "测试👍为")
        textField.delegate = self
        view.addSubview(textField)
        

        let btn = UIButton.createTitleBtn(UIFont.systemFont(ofSize: 15), titleColor:  UIColor.black, title: "重复点击", bgColor: nil, target: self, action: #selector(clickBtn))
        btn.frame = CGRect.init(x: 20, y: 350, width: 200, height: 20)
        view.addSubview(btn)
        
        bannerView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        bannerView.backgroundColor = .clear
        let bannerArray = NSMutableArray()
        for index in 0..<5 {
            let m = LWBannerViewModel()
            m.index = index
            bannerArray.add(m)
        }
        bannerView.bannerArray = bannerArray as! [LWBannerViewModel]
        bannerView.showBanner()
        view.addSubview(bannerView)
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func clickBtn() {
        print("==========")
    }
    
    
    func bannerViewClick(view: LWBannerView, selectIndex: Int) {
        let vc = LWTestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func textFielfChange(view: LWTextField, changeString: String) {
        print(changeString)
    }

}
