//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 杉原匠 on 2017/10/01.
//  Copyright © 2017年 takumi.sugihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //写真の番号
    var imageNo:Int = 0
    //写真の配列
    let imageArray = ["01.jpg","02.jpg","03.jpg","04.jpg"]
    //タイマー用の変数
    var timer: Timer!
    //UIImageViewのOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    //写真を映し出す関数
    func display(){
        
        //写真の番号が0以下の場合の処理
        if imageNo < 0{
            imageNo = imageArray.count - 1
        }
        
        //写真の番号が写真の数より上の場合の処理
        if imageNo > imageArray.count - 1{
            imageNo = 0
        }
        
        //写真の番号から写真の名前を取得
        let imageName = imageArray[imageNo]
        print(imageName)

        //写真の名前から写真を読み込み
        let image = UIImage(named:imageName)
        
        //UIImageViewへ投影
        imageView.image = image
    
    }
    
    func slideshow(){
        imageNo += 1
        display()
    }
    
    //戻るボタンを押した時の処理
    @IBAction func back(_ sender: Any) {
        if timer == nil{
            imageNo -= 1
            print(imageNo)
            display()
        }
    }

    //進むボタンを押した時の処理
    @IBAction func next(_ sender: Any) {
        if timer == nil{
            imageNo += 1
            print(imageNo)
            display()

        }
    }
    
    //再生/停止ボタンを押した時の処理
    @IBAction func startstop(_ sender: Any) {
        //再生/停止の分岐
        if timer == nil{
            //停止状態の処理
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow), userInfo: nil, repeats: true)
        }else{
            //再生状態の処理
            timer.invalidate()
            timer = nil
        }
    }
    
    //画像をタップした時の処理
    @IBAction func tapImage(_ sender: Any) {
        //タイマーを止める
        timer.invalidate()
        timer = nil
        //セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideshow), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.no = imageNo
        resultViewController.Image = imageArray
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

