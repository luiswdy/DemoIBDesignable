//
//  ViewController.swift
//  DemoIBDesignableFromNib
//
//  Created by Luis Wu on 3/31/17.
//  Copyright © 2017 Luis Wu. All rights reserved.
//

import UIKit
import CustomView

class ViewController: UIViewController {

    @IBOutlet weak var nibCustomView: NibCustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        nibCustomView.label.text = "Test"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

