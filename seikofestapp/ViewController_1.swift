//
//  ViewController_1.swift
//  seiko
//
//  Created by 田中千洋 on 2016/12/24.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class ViewController_1: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let imagename: [String] = ["聖光No1.JPG","SDP.JPG", "コミュ力.JPG","のど自慢.JPG", "Mr.JPG"]
    let namearray:[String] = ["聖光No1","SDP", "コミュ力","のど自慢", "Mr.聖光"]

    var tableView: UITableView!
    var nownumber :Int = 0
    var textView: UITextView!

    var detailWindow: UIWindow!
    var detailWindowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailWindow = UIWindow()
        detailWindowButton = UIButton()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 100))
        tableView.register(mainTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nownumber = indexPath.row
        self.makeMyWindow()
    }
    
    /*
     Cellの総数を返す.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagename.count
    }
    
    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! mainTableViewCell
        
        cell.titleLabel.text = namearray[indexPath.row]
        let Image:UIImage = UIImage(named: imagename[indexPath.row])!
        cell.ImageView.image = Image
        cell.timeLabel.text = "10:00~12:00"
        
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func makeMyWindow(){
        
        // 背景を白に設定する.
        detailWindow.frame = CGRect(x:0, y:0, width:300, height:500)
        detailWindow.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        detailWindow.alpha = 0.95
        detailWindow.layer.cornerRadius = 20
        detailWindow.makeKey()
        self.detailWindow.makeKeyAndVisible()
        
        detailWindowButton.frame = CGRect(x:0, y:0, width:100, height:60)
        detailWindowButton.backgroundColor = UIColor.orange
        detailWindowButton.setTitle("Close", for: .normal)
        detailWindowButton.setTitleColor(UIColor.white, for: .normal)
        detailWindowButton.layer.masksToBounds = true
        detailWindowButton.layer.cornerRadius = 20.0
        detailWindowButton.layer.position = CGPoint(x:self.detailWindow.frame.width/2, y:self.detailWindow.frame.height-50)
        detailWindowButton.addTarget(self, action: #selector(hide), for: .touchUpInside)
        self.detailWindow.addSubview(detailWindowButton)
        
        var titleLabel:UILabel = UILabel(frame: CGRect(x:10, y:10, width:self.detailWindow.frame.width - 20, height:40))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 5.0
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text =  namearray[nownumber]
        detailWindow.addSubview(titleLabel)
        
        textView = UITextView(frame: CGRect(x:10, y:60, width:self.detailWindow.frame.width - 40, height:100))
        textView.backgroundColor = UIColor.clear
        textView.text = "大内宿は、会津城下と下野の国（日光今市）を結ぶ32里の区間の中で会津から2番目の宿駅として1640年ごろに整備された宿場町です。"
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.textColor = UIColor.white
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = false
        detailWindow.addSubview(textView)
    }

    func hide(sender:UIButton) {
        detailWindow.isHidden = true
        textView.text = ""
    }


}
