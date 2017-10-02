//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 杉原匠 on 2017/10/02.
//  Copyright © 2017年 takumi.sugihara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //前の画面から受け取る写真の番号のための変数
    var no:Int = 0
    //前の画面から受け取る写真の配列のための変数
    var Image = ["","","",""]
    //UIImageViewのOutlet
    @IBOutlet weak var imageView: UIImageView!

    //写真を映し出す関数
    func display(){
        
        //写真の番号から写真の名前を取得
        let Name = Image[no]
        print(no)
        
        //写真の名前から写真を読み込み
        let image = UIImage(named:Name)
        
        //UIImageViewへ投影
        imageView.image = image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        display()
        
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
