//
//  ViewController.swift
//  Clipboard
//
//  Created by Eduardo on 12/9/15.
//  Copyright © 2015 Eduardo. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var texFieldButtton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "copyToClip:",
            name: UIPasteboardChangedNotification,
            object: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func copyToClip(notification: NSNotification){
        self.showAlertView()
        
    }
    
    func showAlertView(){
        let pasteBoard = UIPasteboard.generalPasteboard().string
        let alert = UIAlertController(title: "alert", message: ""+pasteBoard!+""+" was copied into clipboard", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    @IBAction func textFieldButton(sender: AnyObject) {
        print(textField.text)
    }

}

