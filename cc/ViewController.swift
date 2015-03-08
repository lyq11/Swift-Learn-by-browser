//
//  ViewController.swift
//  cc
//
//  Created by  on 15/3/5.
//  Copyright (c) 2015. All rights reserved.
//

import UIKit


    class ViewController: UIViewController,UIWebViewDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBOutlet var l: UITextField!
    @IBOutlet var b: UIButton!
    @IBOutlet var c: UIWebView!
    @IBOutlet var F: UIButton!
    @IBOutlet var back: UIButton!
   
        
        
    @IBAction func bgc(sender:AnyObject){
        var che12 = l.text
        var str:NSString = che12.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            if !str.hasPrefix("http://"){
                str="http://" + str
        }
        c.loadRequest(NSURLRequest(URL: NSURL(string:str)!,cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 10.0))
        
            }
    
    @IBAction func Forword(sender:AnyObject){
        c.goForward()
    }
    @IBAction func Back(sender:AnyObject){
        c.goBack()
        }
    override func viewDidLoad() {
        super.viewDidLoad()
       check2()
        // Do any additional setup after loading the view, typically from a nib.
        c.delegate = self
    }
   
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool{
        return true
    }
    
    func check2(){
        if c.canGoForward{
            F.enabled = true
        }
        else
        {
            F.enabled = false
        }
        
        if c.canGoBack{
            back.enabled = true
            
        }
        else
        {
            back.enabled = false
        }
    }
    

    func webViewDidStartLoad(webView: UIWebView) {
       }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        check2()
    
        l.text = c.request!.URL.relativeString
        
    }
    
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        var sea = l.text
        var sea2 = sea.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        c.loadRequest(NSURLRequest(URL: NSURL(string: "http://m.bing.com/search?q=" + sea2!)!))


    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

