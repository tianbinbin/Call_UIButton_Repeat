//
//  SWIFTViewController.swift
//  OCSwift
//
//  Created by 田彬彬 on 2017/6/3.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

import UIKit

class SWIFTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = UIColor.gray
        
       // 第一种方式
        StepOne()
        
        
       // 第二种方式
        StepTwo()
    }

    fileprivate func StepOne(){
    
      let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
      btn.backgroundColor = UIColor.green
    
      btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        
      view.addSubview(btn)
    }
    
    
    func btnClick(_ btn:UIButton){
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(printHelloWorld), object: "abc")
        self.perform(#selector(printHelloWorld), with: nil, afterDelay: 0.4)

    }
    
    
    func printHelloWorld(){
        
        print("Swift 打印不出时间- 如果你知道 请大神 告知 --- 是否有延迟")
    }
    
    
    
    
    fileprivate func StepTwo(){
        
        let btn = UIButton(frame: CGRect(x: 100, y: 250, width: 100, height: 100))
        btn.backgroundColor = UIColor.red

        btn.addTarget(self, action: #selector(btnClickTwo(_:)), for: .touchUpInside)
        
        view.addSubview(btn)
    }
    
    func btnClickTwo(_ btn:UIButton){
        
      print("Swift 打印不出时间- 如果你知道 请大神 告知 --- 是否有延迟")
        
    }
}
