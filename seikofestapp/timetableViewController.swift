//
//  ViewController.swift
//  seiko
//
//  Created by 田中千洋 on 2016/12/23.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class timetableViewController: UIViewController ,CAPSPageMenuDelegate {
    
    var pageMenu : CAPSPageMenu?
    
    
    let colorBg1 = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
    let colorBg2 = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    var movecoment:UIBarButtonItem!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = ""
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        var controllerArray : [UIViewController] = []
        
        
        let controller1 = ViewController_1()
        controller1.title = "外ステージ"
        let controller2 = ViewController_1()
        controller2.title = "講堂"
        let controller3 = ViewController_1()
        controller3.title = "小講堂"
        let controller4 = ViewController_1()
        controller4.title = "ライブハウス1"
        let controller5 = ViewController_1()
        controller5.title = "ライブハウス2"
        let controller6 = ViewController_1()
        controller6.title = "体育館"
        let controller7 = ViewController_1()
        controller7.title = "武道場"
        
        controllerArray.append(controller2)
        controllerArray.append(controller1)
        controllerArray.append(controller3)
        controllerArray.append(controller4)
        controllerArray.append(controller5)
        controllerArray.append(controller6)
        controllerArray.append(controller7)
        
        
        
        
        
        self.view.backgroundColor = colorBg2
        
        
        let parameters: [CAPSPageMenuOption] = [
            .selectionIndicatorColor(UIColor.orange),
            .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "HelveticaNeue", size: 15)!),
            .menuHeight(40.0),
            .menuItemWidth(90.0),
            .centerMenuItems(true)
        ]
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        
        
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

