//
//  PinCodeChallengeHandler.swift
//  PinCodeSwift
//
//  Created by Nathan Hazout on 03/02/2016.
//  Copyright © 2016 Sample. All rights reserved.
//

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
    
    
}