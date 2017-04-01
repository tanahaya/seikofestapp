//
//  ViewController.swift
//  seiko
//
//  Created by 田中千洋 on 2016/12/23.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class foodViewController: UIViewController ,CAPSPageMenuDelegate {
    
    var pageMenu : CAPSPageMenu?
    
    
    let colorBg1 = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    var movecoment:UIBarButtonItem!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = ""
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        var controllerArray : [UIViewController] = []
        
        
        let controller1 = middle2f()
        controller1.title = "中学棟2階"
        let controller2 = middle3f()
        controller2.title = "中学棟3階"
        let controller3 = middle4f()
        controller3.title = "中学棟4階"
        let controller4 = high2f()
        controller4.title = "高校棟2階"
        let controller5 = high3f()
        controller5.title = "高校棟3階"
        let controller6 = high4f()
        controller6.title = "高校棟4階"
        
        controllerArray.append(controller1)
        controllerArray.append(controller2)
        controllerArray.append(controller3)
        controllerArray.append(controller4)
        controllerArray.append(controller5)
        controllerArray.append(controller6)
        
        
        self.view.backgroundColor = colorBg2
        
        
        let parameters: [CAPSPageMenuOption] = [
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 15)!),
            .menuHeight(40.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true)
        ]
        
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0,y: 18,width: self.view.frame.width,height: self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        // pageMenu!.didMoveToParentViewController(self)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func movecoment(sender:UIBarButtonItem){
        // let mySecondViewController: UIViewController = comentViewController()
        // Viewの移動する.
        // self.navigationController?.pushViewController(mySecondViewController, animated: true)
    }
    
    
}

