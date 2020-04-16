//
//  ViewController.swift
//  SwifterSwiftTKS
//
//  Created by gabmarfer on 03/28/2019.
//  Copyright (c) 2019 gabmarfer. All rights reserved.
//

import UIKit
import SwifterSwiftTKS

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let image = UIImage(named: "person") {
            textField.setLeftViewImage(image)
            textField.leftViewTintColor = UIColor.green
        }
        
    }

}

