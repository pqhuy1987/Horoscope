//
//  SecondViewController.swift
//  DailyZodiacHoroscope
//
//  Created by Ifeoluwa King on 13/08/2016.
//  Copyright © 2016 Ifeoluwa King. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var zodiacImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var horosLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var urlString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacImg.layer.cornerRadius = 3
        zodiacImg.clipsToBounds = true
        horosLbl.layer.cornerRadius = 3
        horosLbl.clipsToBounds = true

    }
    

    

    override func viewDidAppear(animated: Bool) {
        if theTag == 0 {
            urlString = "http://www.astrology.com/horoscope/daily/aries.html"
        }else if theTag == 1 {
            urlString = "http://www.astrology.com/horoscope/daily/taurus.html"
        }else if theTag == 2 {
            urlString = "http://www.astrology.com/horoscope/daily/gemini.html"
        }else if theTag == 3 {
            urlString = "http://www.astrology.com/horoscope/daily/cancer.html"
        }else if theTag == 4 {
            urlString = "http://www.astrology.com/horoscope/daily/leo.html"
        }else if theTag == 5 {
            urlString = "http://www.astrology.com/horoscope/daily/virgo.html"
        }else if theTag == 6 {
            urlString = "http://www.astrology.com/horoscope/daily/libra.html"
        }else if theTag == 7 {
            urlString = "http://www.astrology.com/horoscope/daily/scorpio.html"
        }else if theTag == 8 {
            urlString = "http://www.astrology.com/horoscope/daily/sagittarius.html"
        }else if theTag == 9 {
            urlString = "http://www.astrology.com/horoscope/daily/capricorn.html"
        }else if theTag == 10 {
            urlString = "http://www.astrology.com/horoscope/daily/aquarius.html"
        }else if theTag == 11 {
            urlString = "http://www.astrology.com/horoscope/daily/pisces.html"
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateLabel.text = dateFormatter.stringFromDate(NSDate())
        
        zodiacImg.image = UIImage(named: "\(theTag).png")
        zodiacImg.layer.cornerRadius =  zodiacImg.frame.width/2;
        
        activityIndicator.startAnimating()
        
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            if let responseData = data {
                
                let webContent = NSString(data: responseData, encoding: NSUTF8StringEncoding)
                
                let webContentArray = webContent?.componentsSeparatedByString("<div class=\"page-horoscope-text\" style=\"height:145px;\">")
                
                if webContentArray!.count > 0 {
                    
                    let horoscopeArray = webContentArray![1].componentsSeparatedByString("</div>")
                    
                    if horoscopeArray.count > 0 {
                        self.zodiacImg.hidden = false
                        self.dateLabel.hidden = false
                        self.horosLbl.hidden = false
                        self.activityIndicator.stopAnimating()
                        
                       self.horosLbl.text = "\(horoscopeArray[0])"
                        
                    }
                    
                }
            }else {
                print(error)
            }
        }
        task.resume()
    }
    

}
