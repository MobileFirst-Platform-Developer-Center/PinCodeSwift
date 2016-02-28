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

import Foundation
import IBMMobileFirstPlatformFoundation

class PinCodeChallengeHandler : WLChallengeHandler {

    //SecurityCheck name
    static let securityCheck = "PinCodeAttempts"

    //Register this class as a challenge handler
    static func registerSelf() {
        WLClient.sharedInstance().registerChallengeHandler(PinCodeChallengeHandler(securityCheck: securityCheck))
    }


    //Get this registered challenge handler
    internal static func getRegisteredChallengeHandler()->PinCodeChallengeHandler? {
        return WLClient.sharedInstance().getChallengeHandlerBySecurityCheck(securityCheck) as? PinCodeChallengeHandler
    }

    override func handleChallenge(challenge: [NSObject : AnyObject]!) {
        NSLog("%@",challenge)
        var errorMsg : String
        if challenge["errorMsg"] is NSNull {
            errorMsg = "This data requires a PIN code."
        }
        else{
            errorMsg = challenge["errorMsg"] as! String
        }
        let remainingAttempts = challenge["remainingAttempts"] as! Int

        showPopup(errorMsg,remainingAttempts: remainingAttempts)
    }

    override func handleFailure(failure: [NSObject : AnyObject]!) {
        if let errorMsg = failure["failure"] as? String {
            showError(errorMsg)
        }
        else{
            showError("Unknown error")
        }
    }

    func showPopup(errorMsg: String, remainingAttempts: Int){
        let message = errorMsg + "\nRemaining attempts: " + String(remainingAttempts)

        let alert = UIAlertController(title: "Protected",
            message: message,
            preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "PIN CODE"
            textField.keyboardType = .NumberPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let pinTextField = alert.textFields![0] as UITextField
            self.submitChallengeAnswer(["pin": pinTextField.text!])
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            self.submitFailure(nil)
        }))

        dispatch_async(dispatch_get_main_queue()) {
            let topController = UIApplication.sharedApplication().keyWindow!.rootViewController! as UIViewController
            topController.presentViewController(alert,
                animated: true,
                completion: nil)
        }


    }

    func showError(errorMsg: String){
        let alert = UIAlertController(title: "Error",
            message: errorMsg,
            preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))

        dispatch_async(dispatch_get_main_queue()) {
            let topController = UIApplication.sharedApplication().keyWindow!.rootViewController! as UIViewController
            topController.presentViewController(alert,
                animated: true,
                completion: nil)
        }
    }

    override func handleSuccess(success: [NSObject : AnyObject]!) {
        NSLog("handleSuccess: %@",success)
    }

}
