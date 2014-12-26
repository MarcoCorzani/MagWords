//
//  ViewController.swift
//  MagWords
//
//  Created by Marco F.A. Corzani on 19.12.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var screenShot: UIButton!
    
    @IBAction func screenShotPressed(sender: AnyObject) {
        
    var image = takeScreenShot(imageView)  //screenShot
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    
    }
    
    func takeScreenShot(theView: UIView) -> UIImage {
    
        //var theView = imageView   //vorher view! Hat alles gegrappt
        
        UIGraphicsBeginImageContextWithOptions(theView.bounds.size, true, 0.0)
        
        theView.drawViewHierarchyInRect(theView.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    
        return image
    }
    
    
    
    
    
    @IBOutlet weak var appendTextField: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        imageView.userInteractionEnabled = true   //Geht auch im Storyboard
        
        var wordArray = [" wir", " sind", " alle", " keine", " Sünder", " und", " echte", " Heiligen", " auch"]
    
        //wordArray.append("Frau")
        
        
        view.backgroundColor = UIColor.blackColor()
    
        for word in wordArray {
        
            
            
            var label = UILabel()
            label.text = word
            label.font = UIFont.systemFontOfSize(32)
            label.textColor = UIColor.blueColor()
        
            
            label.sizeToFit()
            label.backgroundColor = UIColor.clearColor()
            label.center = CGPoint(x: 150, y: 200)
            
            
            var x = CGFloat(arc4random_uniform(320))
            var y = CGFloat(arc4random_uniform(320))
            label.center = CGPoint(x: x, y: y)
            
//            view.addSubview(label)
            imageView.addSubview(label)
            
            // Pan Gesture
            var panGesture = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(panGesture)
            label.userInteractionEnabled = true
            
        
     
        
        }
    
       
        
        }
    
   
        func handlePanGesture(panGesture: UIPanGestureRecognizer) {
    
        
        
    
        // get translation
        var translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        println(translation)
        
        // add dx, dy, to current label center position
    
        var label = panGesture.view as UILabel
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    
}
    
    

    

}

