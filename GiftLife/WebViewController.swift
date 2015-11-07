//
//  WebViewController.swift
//  GiftLife
//
//  Created by MacBook Pro on 06/11/15.
//  Copyright © 2015 UTEZ. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://gift-life-hectorbastida.c9users.io/ShareLifeServer/client/#/")!))
        self.view.addSubview(webView)
    }
    
    
}
