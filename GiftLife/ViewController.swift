//
//  ViewController.swift
//  GiftLife
//
//  Created by MacBook Pro on 06/11/15.
//  Copyright © 2015 UTEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

   
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
       ScrollView.contentSize.height = 1000
    
        let tap = UITapGestureRecognizer(target: self, action: Selector("tappedMe"))
        imageView.addGestureRecognizer(tap)
        imageView.userInteractionEnabled = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    @IBAction func OpenUrl(sender: AnyObject) {
        if sender.tag == 1 {
            UIApplication.sharedApplication().openURL(NSURL(string:"http://www.cenatra.salud.gob.mx/")!)
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string:"http://asociacionale.org/index.php/es/")!)
        }
    }
   
    func tappedMe(){
       self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("webViewSegue") as UIViewController, animated: true)
    }
    
    
}

