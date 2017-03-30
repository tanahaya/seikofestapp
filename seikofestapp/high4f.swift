//
//  ViewController_2.swift
//  seiko
//
//  Created by 田中千洋 on 2016/12/24.
//  Copyright © 2016年 田中 颯. All rights reserved.
//

import UIKit

class high4f: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    
    let imagename: [String] = ["レゴランド.jpg","THE5MINIUTES.jpg", "クイズ研究会.jpg","プロ野球研究会.jpg", "ろご完成版.png"]
    let namearray:[String] = ["レゴランド","THE 5 MINIUTES","クイズ研究会","プロ野球研究会","sesda"]
    let content:[String] = ["聖光学院にレゴランドがついに登場⁈圧巻の作品達を見逃すな!","新感覚のリアル脱出ゲームが登場!!探偵となり、殺人現場に隠された謎を解読して密室から脱出セヨ!!与えられた時間はTHE 5 MINUTES"," 一匹の妖怪が日本を徘徊している。すなわち、競技クイズの妖怪である。万国のプロレタリア早押しせよ！","プロ野球を愛する男たちがお届けする、“神ってる”展示をご覧あれ！景品付きストラックアウトもあるよ！","今年はルールブックも配布するので、腕に自信がある方は勿論、初心者の方も気軽にお越しください。"]
    var nownumber :Int = 0
    var detailWindow: UIWindow!
    var detailWindowButton: UIButton!
    var textView: UITextView!
    
    var posX: CGFloat!
    var posY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailWindow = UIWindow()
        detailWindowButton = UIButton()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:150, height:170)
        layout.sectionInset = UIEdgeInsetsMake( -10, 20, 20, 20)
        layout.headerReferenceSize = CGSize(width:100,height:30)
        
        let collectionframe = (frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - 60))
        
        collectionView = UICollectionView(frame: collectionframe , collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nownumber = indexPath.row
        self.makeMyWindow()
        
    }
    
    /*
     Cellの総数を返す
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    /*
     Cellに値を設定する
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell",for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.orange
        
        let ImageView:UIImageView = UIImageView(frame: CGRect(x: 20 + 185 * (indexPath.row % 2)  , y: 20 + 180 * (indexPath.row / 2) , width: 150, height: 150))
        let Image:UIImage = UIImage(named: imagename[indexPath.row])!
        ImageView.image = Image
        self.collectionView.addSubview(ImageView)
        let nameLabel:UILabel = UILabel(frame: CGRect(x: 30 + 185 * (indexPath.row % 2) ,y: 170 + 180 * (indexPath.row / 2) ,width: 150,height: 20))
        nameLabel.text = namearray[indexPath.row]
        self.collectionView.addSubview(nameLabel)
        
        return cell
    }
    func makeMyWindow(){
        
        // 背景を白に設定する.
        detailWindow.frame = CGRect(x:0, y:0, width:300, height:500)
        detailWindow.layer.position = CGPoint(x:self.view.frame.width/2, y:self.view.frame.height/2)
        detailWindow.alpha = 0.9
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
        
        let titleLabel:UILabel = UILabel(frame: CGRect(x:10, y:10, width:self.detailWindow.frame.width - 20, height:40))
        titleLabel.backgroundColor = UIColor.white
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 5.0
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = namearray[nownumber]
        detailWindow.addSubview(titleLabel)
        
        textView = UITextView(frame: CGRect(x:10, y:60, width:self.detailWindow.frame.width - 40, height:100))
        textView.backgroundColor = UIColor.clear
        textView.text = content[nownumber]
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.textColor = UIColor.white
        textView.textAlignment = NSTextAlignment.left
        textView.isEditable = false
        detailWindow.addSubview(textView)
        
    }
    
    func hide(sender:UIButton) {
        textView.text = ""
        detailWindow.isHidden = true
    }
    
    
}


