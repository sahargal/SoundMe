//
//  ViewController.swift
//  SoundMe
//
//  Created by dror gal on 3/5/16.
//  Copyright © 2016 dror gal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserManger.Instance.checkUser("Dror", password: "King")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

