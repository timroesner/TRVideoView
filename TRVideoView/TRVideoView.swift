//
//  TRVideoView.swift
//  TRVideoView
//
//  Created by Tim Roesner on 9/21/17.
//  Copyright © 2017 Tim Roesner. All rights reserved.
//

import UIKit
import WebKit

open class TRVideoView: WKWebView {
    
    var text = ""
    var urls = [URL]()
    
    public convenience init(text: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 340, height: 180))
        self.text = text
        self.urls = text.extractURLs()
        self.backgroundColor = .clear
        self.isOpaque = false
        self.scrollView.isScrollEnabled = false

        setup()
    }
    
    open func containsURLs() -> Bool {
        if(self.urls.isEmpty){
            return false
        } else {
            var result = false
            for url in self.urls{
                if(url.absoluteString.contains("youtu") || url.absoluteString.contains("vimeo.com")){
                    result = true
                }
            }
            return result
        }
    }
    
    open func textWithoutURLs() -> String{
        var result = self.text
        
        // If URL is in the middle of the text it will create a double space, but that's okay for now
        for url in self.urls {
            result = result.replacingOccurrences(of: "\(url.absoluteString)", with: "")
        }
        
        return result
    }
    
    func setup() {
        
        for url in self.urls {
            
            // If vimeo URL embedded vimeo player
            if(url.absoluteString.contains("vimeo.com")){
                print(url.pathComponents)
                var link = url.lastPathComponent
                link = "https://player.vimeo.com/video/"+link
                DispatchQueue.main.async(execute: { () -> Void in
                    self.loadHTMLString("<head> <meta name=viewport content='width=device-width, initial-scale=1'><style type='text/css'> body { margin: 0;} </style></head><iframe src='\(link)' width='100%' height='100%' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>", baseURL: nil)
                })
                
            // If YouTube URL embedded YouTube player
            } else if(url.absoluteString.contains("youtu")){
                
                // Fool proof video ID decoding
                var link = ""
                if (url.host?.contains("youtube.com") ?? false) {
                    var _l = "https://www.youtube.com/embed/"+url["v"]+"?rel=0"
                    let time = url["t"]
                    if !time.isEmpty {
                        _l += "&start=\(time)"
                    }
                    link = _l
                } else if (url.host?.contains("youtu.be") ?? false) {
                    var _l = "https://www.youtube.com/embed/"+url.lastPathComponent+"?rel=0"
                    let time = url["t"]
                    if !time.isEmpty {
                        _l += "&start=\(time)"
                    }
                    link = _l
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.loadHTMLString("<head> <meta name=viewport content='width=device-width, initial-scale=1'><style type='text/css'> body { margin: 0;} </style></head><iframe width='100%' height='100%' src='\(link)' frameborder='0' allowfullscreen></iframe>", baseURL: nil)
                })
            }
        }
    }
}
