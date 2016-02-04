//
//  ViewController.swift
//  PinCodeSwift
//
//  Created by Nathan Hazout on 03/02/2016.
//  Copyright © 2016 Sample. All rights reserved.
//

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController {
    @IBOutlet weak var balanceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getBalance(sender: UIButton) {
        let request = WLResourceRequest(URL: NSURL(string: "/adapters/ResourceAdapter/balance"), method: WLHttpMethodGet)
        request.sendWithCompletionHandler { (response, error) -> Void in
            if(error == nil){
                NSLog(response.responseText)
                self.balanceLabel.text = "Balance = " + response.responseText
                
            }
            else{
                NSLog(error.description)
                self.balanceLabel.text = "Failed to get balance"
            }
        }
        
    }

}

