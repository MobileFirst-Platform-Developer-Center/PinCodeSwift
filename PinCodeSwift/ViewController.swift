/**
* Copyright 2016 IBM Corp.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

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
