//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岩田康史 on 2020/11/09.
//  Copyright © 2020 yasushi.iwata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    var indexNum = 0
    
    let images = ["image01.jpg", "image02.jpg", "image03.jpg", "image04.jpg", "image05.jpg"
                , "image06.jpg", "image07.jpg", "image08.jpg", "image09.jpg", "image10.jpg"
                , "image11.jpg", "image12.jpg", "image13.jpg", "image14.jpg", "image15.jpg"
                , "image16.jpg", "image17.jpg", "image18.jpg", "image19.jpg", "image20.jpg"
                , "image21.jpg", "image22.jpg", "image23.jpg", "image24.jpg", "image25.jpg"
                , "image26.jpg", "image27.jpg", "image28.jpg", "image29.jpg", "image30.jpg"
                , "image31.jpg", "image32.jpg", "image33.jpg"]
    
    @IBOutlet weak var paintImageView: UIImageView!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!  //進むボタンを変数に関連付け
    @IBOutlet weak var backButtonOutlet: UIButton!  //戻るボタンを変数に関連付け
    @IBOutlet weak var startStopButtonOutlet: UIButton! //再生停止ボタンを変数に関連付け
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintImageView.image = UIImage(named: images[indexNum])
        startStopButtonOutlet.setTitle("再生", for: .normal)
    }
    
    @IBAction func startStopButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:                  #selector(timerMethod), userInfo: nil, repeats: true)
            startStopButtonOutlet.setTitle("停止", for: .normal)  //停止ボタンに変更
            nextButtonOutlet.isEnabled = false  //進むボタンを選択不可にする
            backButtonOutlet.isEnabled = false  //戻るボタンを選択不可にする
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startStopButtonOutlet.setTitle("再生", for: .normal)  //再生ボタンに変更
            nextButtonOutlet.isEnabled = true   //進むボタンを選択可能にする
            backButtonOutlet.isEnabled = true   //戻るボタンを選択可能にする
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        indexNum += 1
        
        if indexNum == 33 {
            indexNum = 0
        }
        paintImageView.image = UIImage(named: images[indexNum])
    }
    
    @IBAction func backButton(_ sender: Any) {
        indexNum -= 1
        
        if indexNum == -1 {
            indexNum = 32
        }
        paintImageView.image = UIImage(named: images[indexNum])
    }
    
    
    @objc func timerMethod() {
        indexNum += 1
        
        if indexNum == 33 {
            indexNum = 0
        }
        
        paintImageView.image = UIImage(named: images[indexNum])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //スライドショーを停止する
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startStopButtonOutlet.setTitle("再生", for: .normal)  //再生ボタンに変更
            nextButtonOutlet.isEnabled = true   //進むボタンを選択可能にする
            backButtonOutlet.isEnabled = true   //戻るボタンを選択可能にする
        }
        
        //画像の値渡し
        let bigImageViewController:BigImageViewController = segue.destination as! BigImageViewController
        
        bigImageViewController.x = UIImage(named: images[indexNum])
        
    }
    
}

