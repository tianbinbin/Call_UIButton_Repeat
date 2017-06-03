//
//  UIButtonExtention.swift
//  OCSwift
//
//  Created by 田彬彬 on 2017/6/3.
//  Copyright © 2017年 田彬彬. All rights reserved.
//
import UIKit
import Foundation

public extension UIButton{

    private struct cs_associatedKeys {
        static var accpetEventInterval = "cs_acceptEventInterval"
        static var acceptEventTime = "cs_acceptEventTime"
    }
    /**
     重复点击的时间间隔--自己手动随意设置
     利用运行时机制 将accpetEventInterval值修改
     */
    var cs_accpetEventInterval: TimeInterval {
        get {
            if let accpetEventInterval = objc_getAssociatedObject(self, &cs_associatedKeys.accpetEventInterval) as? TimeInterval {

                return accpetEventInterval            }
            return 0.4
        }
        set {
            objc_setAssociatedObject(self, &cs_associatedKeys.accpetEventInterval, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /**
     重复点击的时间间隔--自己手动随意设置
     利用运行时机制 将acceptEventTime值修改
     */
    var cs_acceptEventTime : TimeInterval {
        get {
            if let acceptEventTime = objc_getAssociatedObject(self, &cs_associatedKeys.acceptEventTime) as? TimeInterval {
                return acceptEventTime
            }
            return 0.4
        }
        set {
            objc_setAssociatedObject(self, &cs_associatedKeys.acceptEventTime, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /**
     重写初始化方法,在这个方法中实现在运行时方法替换
     */
    override open class func initialize() {
        let changeBefore: Method = class_getInstanceMethod(self, #selector(UIButton.sendAction(_:to:for:)))
        let changeAfter: Method = class_getInstanceMethod(self, #selector(UIButton.cs_sendAction(action:to:for:)))
        method_exchangeImplementations(changeBefore, changeAfter)
    }
    /**
     在这个方法中判断接收到当前事件的时间间隔是否满足我们所设定的间隔,会一直循环调用到满足才会return
     */
    func cs_sendAction(action: Selector, to target: AnyObject?, for event: UIEvent?) {
        if NSDate().timeIntervalSince1970 - self.cs_acceptEventTime < self.cs_accpetEventInterval {
            return
        }
        if self.cs_accpetEventInterval > 0 {
            self.cs_acceptEventTime = NSDate().timeIntervalSince1970
        }
        self.cs_sendAction(action: action, to: target, for: event)
    }

}
