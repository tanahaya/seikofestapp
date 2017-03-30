//
//  detailViewController.swift
//  seiko
//
//  Created by 田中千洋 on 2016/12/25.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UIScrollViewDelegate  {

    var pageControl: UIPageControl!
    
    var scrollView: UIScrollView!
    
    let pageSize = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.maxX
        let height = self.view.frame.maxY

        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width:CGFloat(pageSize) * width,height: 0)
        self.view.addSubview(scrollView)
        
        for i in 0 ..< pageSize {
            
            let label:UILabel = UILabel(frame: CGRect(x:CGFloat(i) * width + width/2 - 150,y: 100,width: 300,height: 200))
            label.backgroundColor = UIColor.red
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.center
            label.text = "画像\(i+1)"
            label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            scrollView.addSubview(label)
        }
        
        pageControl = UIPageControl(frame: CGRect(x:0,y: self.view.frame.maxY - 50,width: width,height: 50))
        pageControl.backgroundColor = UIColor.lightGray
        
        // PageControlするページ数を設定.
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定.
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        self.view.addSubview(pageControl)
        
        
        
        self.view.backgroundColor = UIColor.white
        
        let backButton: UIButton = UIButton(frame: CGRect(x: self.view.bounds.width/2 - 60,y: 550, width: 120, height: 50))
        backButton.backgroundColor = UIColor.red
        backButton.layer.masksToBounds = true
        backButton.setTitle("BACK", for: .normal)
        backButton.layer.cornerRadius = 20.0
        backButton.addTarget(self, action: #selector(backtofirst(sender:)), for: .touchUpInside)
        
        // ボタンを追加する.
        self.view.addSubview(backButton)
        
        
        let label: UILabel = UILabel(frame: CGRect(x:self.view.bounds.width/2 - 150 , y:330 , width:300, height: 200))
        label.backgroundColor = UIColor.orange
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.textColor = UIColor.white
        label.text = "詳細を書くところ"
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)

        
        // Do any additional setup after loading the view.
    }
    
    func backtofirst(sender: UIButton){
        
        // 遷移するViewを定義する.
        let myMainTabBarController: UIViewController = MainTabBarController()
        
        // アニメーションを設定する.
        myMainTabBarController.modalTransitionStyle = .partialCurl
        
        // Viewの移動する.
        self.present(myMainTabBarController, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
     移動が完了したら呼ばれる.
     */
    

}
