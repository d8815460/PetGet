//
//  ViewController.swift
//  PetGet
//
//  Created by 駿逸 陳 on 2016/6/4.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageurl:NSURL! = NSURL(string: "http://i.imgur.com/peft5wI.jpg")
        imageView.kf_setImageWithURL(imageurl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

