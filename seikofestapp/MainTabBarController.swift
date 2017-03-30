//
//  MainTabBarController.swift
//  seikofestapp
//
//  Created by 田中千洋 on 2016/12/25.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    var displayView: displayViewController!
    var timetableView: timetableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        displayView = displayViewController()
        timetableView = timetableViewController()
        
        displayView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 1)
        timetableView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 2)
        
        // タブで表示するViewControllerを配列に格納します。
        let myTabs = NSArray(objects: displayView!, timetableView!)
        
        // 配列をTabにセットします。
        self.setViewControllers(myTabs as? [UIViewController], animated: false)

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
