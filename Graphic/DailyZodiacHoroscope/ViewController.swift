//
//  ViewController.swift
//  DailyZodiacHoroscope
//
//  Created by Ifeoluwa King on 13/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit

var theTag:Int!
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func btnPressed(sender: AnyObject) {
        theTag = sender.tag
        self.performSegueWithIdentifier("horoscopeDetail", sender: nil)
    }

}

