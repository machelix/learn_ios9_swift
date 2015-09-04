//
//  ViewController.swift
//  WebBrowser
//
//  Created by Nagarajan on 8/28/15.
//  Copyright © 2015 MotleyTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var webAddress: UITextField!

    @IBOutlet weak var webView: UIWebView!

    @IBAction func onGo(sender: AnyObject) {
        webAddress.resignFirstResponder()
        loadWebPage()
    }

    @IBAction func onLeft(sender: AnyObject) {
        webView.goBack()
    }
    @IBAction func onRight(sender: AnyObject) {
        webView.goForward()
    }
    @IBAction func onZoomOut(sender: AnyObject) {
        webView.scrollView.zoomScale /= 1.2
    }
    @IBAction func onZoomIn(sender: AnyObject) {
        webView.scrollView.zoomScale *= 1.2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webAddress.delegate = self
        webView.scalesPageToFit = true
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        webAddress.resignFirstResponder()
        loadWebPage()
        return true
    }

    func loadWebPage() {
        if webAddress.text != "" {
            var address = webAddress.text!
            if !address.hasPrefix("http://") {
                address = "http://" + address
            }

            let url = NSURL(string: address)
            let request = NSURLRequest(URL: url!)
            webView.loadRequest(request)


        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

