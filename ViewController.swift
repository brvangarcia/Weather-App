//
//  ViewController.swift
//  Whats the weather
//
//  Created by Bryan on 8/3/16.
//  Copyright © 2016 Bryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userCity: UITextField!
    
    @IBAction func findWheather(sender: AnyObject) {
        
        var url = NSURL(string: "https://weather.com/weather/today/l/" + userCity.text?.stringByReplacingOccurrencesOfString(" ", withString: "-",",")
        
        if url != nil {
            
            var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data,response,error) -> Void in
                
                var urlError =  false
                
                var weather = ""
                
                if error == nil {
                    
                    var urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding ) as NSString!
                    
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"today-wx-descrip\" data-ng-bind=\"todayLookingAheadVm.activeDay.narrative\">")
                    
                    var urlContentArray.count > 0 {
                        
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        
                        weather = weatherArray[0] as String
                        
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    }else {
                        
                        urlError = true
                        
                    }
                    
                    print(urlContentArray[2])
                    
                } else {
                    
                    urlError = true
                    
                }
                
                dispatch_async(dispatch_get_main_queue())
                
                if urlError == true {
                    
                    self.showError()
                    
                }else {
                    
                    self.resultLabel.text = whe
                    
                }
            }
        })
        
        task.resume()
        
    } else {
    
    showError()
    
    }

    }

    @IBOutlet weak var resultLabel: UILabel!
    
    func showError() {
        
        resultLabel.text = "Was not able to find " + userCity.text! + ". Please try again"
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

