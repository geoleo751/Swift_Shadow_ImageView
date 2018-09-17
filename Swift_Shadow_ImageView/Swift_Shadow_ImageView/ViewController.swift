//
//  ViewController.swift
//  Swift_Shadow_ImageView
//
//  Created by George Leonidas on 17/09/2018.
//  Copyright © 2018 George Leonidas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewFromStoryboard: SwiftShadowImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        imageViewFromStoryboard.borderColor = .darkGray
        imageViewFromStoryboard.imageShadowColor = .red
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

