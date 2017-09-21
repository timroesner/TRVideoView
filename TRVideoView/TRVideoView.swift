//
//  TRVideoView.swift
//  TRVideoView
//
//  Created by Tim Roesner on 9/21/17.
//  Copyright © 2017 Tim Roesner. All rights reserved.
//

import UIKit
import WebKit

class TRVideoView: WKWebView {
    
    var text = ""
    
    public convenience init(text: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 340, height: 180))
        self.text = text
        setup()
    }
    
    func size(width: CGFloat, height: CGFloat){
        self.frame.size = CGSize(width: width, height: height)
        setup()
    }
    
    func setup(){
        // Get all URLs from the text
        let urls = self.text.extractURLs()
        
        
        for url in urls {
            
            // If vimeo URL embedded vimeo player
            if(url.absoluteString.contains("vimeo.com")){
                var html = url.absoluteString
                html = "https://player.vimeo.com/video/"+html.suffix(9)
                print(html)
                self.loadHTMLString("<iframe src='\(html)' width='\(self.frame.width*3)' height='\(self.frame.height*3)' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>", baseURL: nil)
                
            // If YouTube URL embedded YouTube player
            } else if(url.absoluteString.contains("youtu")){
                var link = url.absoluteString
                link = "https://www.youtube.com/embed/"+link.suffix(11)+"?rel=0"
                print(link)
                self.loadHTMLString("<iframe width='\(self.frame.width*3)' height='\(self.frame.height*3)' src='\(link)' frameborder='0' allowfullscreen></iframe>", baseURL: nil)
            }
        }
    }
}
