//
//  ViewController.swift
//  WordMagnets
//
//  Created by Annemarie Ketola on 12/5/14.
//  Copyright (c) 2014 UpEarly. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    var wordArray = ["bail", "close out", "cutback", "dawn patrol", "board", "rip", "swell", "tide", "wipe out", "stoked", "green room", "charging", "waves", "drop", "in", "epic", "ocean", "the", "the", "a", "I", "can", "am", "riding", "find", "pipe", "get", "go", "sunset", "got", "with", "my", "in", "so"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for word in wordArray {
            var label = UILabel()
            label.text = word //wordArray[2]
            
            
            view.addSubview(label)
//            label.font = UIFont.systemFontOfSize(25)
//            label.font = UIFont.boldSystemFontOfSize(25)
            label.font = UIFont(name: "Papyrus", size: 30)
            
            label.sizeToFit()
            label.center = CGPoint(x: 150, y: 200)
//            label.backgroundColor = UIColor.redColor()
            label.backgroundColor = UIColor.clearColor()
            label.textColor = UIColor.whiteColor()
            
            var x = CGFloat(arc4random_uniform(300)+25)
//            var y = CGFloat(arc4random_uniform(460))
            var y = CGFloat(arc4random_uniform(500)+80)
            
            label.center = CGPoint(x: x, y: y)
            
            view.addSubview(label)
            
            //Pan Gesture
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
        }
        
        
    }

    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        println("pan")
        
        // get translation
        var translation = panGesture.translationInView(view)
        //resets the translation to zero, so that when you add it to the label.center, it won't be a hyper fast movement
        panGesture.setTranslation(CGPointZero, inView: view)
    
        println(translation)
        
        
        // add dx, dy to current label center position
        // makes the gesture the UILabel
        var label = panGesture.view as UILabel
        //Adds the center of the label coordinates to the reset translation.x(or.y) you set to zero above that they match up and the gesture moves the label under your finger
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    }
    
    @IBAction func facebookButtonPressed(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Share on Facebook")
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func twitterButtonPressed(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Share on Twitter")
            self.presentViewController(twitterSheet, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

