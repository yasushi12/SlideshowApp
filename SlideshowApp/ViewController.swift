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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        paintImageView.image = UIImage(named: "image01.jpg")
        paintImageView.image = UIImage(named: images[indexNum])
    }
    
    @IBAction func startStopButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:                  #selector(timerMethod), userInfo: nil, repeats: true)
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
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
        let bigImageViewController:BigImageViewController = segue.destination as! BigImageViewController
        
        bigImageViewController.x = UIImage(named: images[indexNum])
        
    }
    
}

