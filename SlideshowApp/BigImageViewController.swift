//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by 岩田康史 on 2020/11/18.
//  Copyright © 2020 yasushi.iwata. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    
    var x: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImage.image = x
        
    }
    

}
