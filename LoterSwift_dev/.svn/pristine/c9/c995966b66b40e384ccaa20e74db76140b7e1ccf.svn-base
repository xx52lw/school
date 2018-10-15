//
//  UIView+LW.swift
//  Loter-swift
//
//  Created by 张星星 on 2018/3/30.
//  Copyright © 2018年 LW. All rights reserved.
//

import UIKit
import Foundation
import UIKit

extension UIView {
    /// x坐标
    var x : CGFloat {
        get {
            return frame.origin.x
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    /// y坐标
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    /// height高度
    var height : CGFloat {
        get {
            return frame.size.height
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    /// width宽度
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    /// left左边界
    var left : CGFloat {
        get {
            return x
        }
        set(newVal) {
            x = newVal
        }
    }
    
    /// right右边界
    var right : CGFloat {
        get {
            return x + width
        }
        set(newVal) {
            x = newVal - width
        }
    }
    
    /// top上边界
    var top : CGFloat {
        get {
            return y
        }
        set(newVal) {
            y = newVal
        }
    }
    
    /// bottom下边界
    var bottom : CGFloat {
        get {
            return y + height
        }
        set(newVal) {
            y = newVal - height
        }
    }
    /// centerX中心点X
    var centerX : CGFloat {
        get {
            return center.x
        }
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    /// centerY中心点Y
    var centerY : CGFloat {
        get {
            return center.y
        }
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    /// middlePoint中心点
    var middlePoint : CGPoint {
        get {
            return center
        }
    }
    /// view的size
    var size : CGSize {
        get {
            return frame.size
        }
    }
}
