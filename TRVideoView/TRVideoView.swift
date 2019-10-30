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

    private var playsInline: Bool = false

    /// Allows you to initialize the view with a prepopulated text and customizing whether to play videos inline.
    /// - Parameters:
    ///   - text: The text to extract video urls from
    ///   - allowInlinePlayback: Whether to allow video to play inline rather than always being full screen.
    ///       If set to true, then video will start playing inline by default.
    public convenience init(text: String, allowInlinePlayback: Bool = false) {
        let webConfiguration = WKWebViewConfiguration()
        if (allowInlinePlayback) {
            webConfiguration.allowsInlineMediaPlayback = true
            webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        }

        self.init(frame: CGRect(x: 0, y: 0, width: 340, height: 180), configuration: webConfiguration)

        self.playsInline = allowInlinePlayback

        self.text = text
        self.urls = text.extractURLs()

        self.scrollView.isScrollEnabled = false

        setup()
    }

    open func containsURLs() -> Bool {
        if(self.urls.isEmpty){
            return false
        } else {
            var result = false
            for url in self.urls {
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
            if(url.absoluteString.contains("vimeo.com")) {
                print(url.pathComponents)
                let query = playsInline ? "?playsinline=1" : ""
                let link = "https://player.vimeo.com/video/" + url.lastPathComponent + query
                DispatchQueue.main.async(execute: { () -> Void in
                    self.loadHTMLString("<head> <meta name=viewport content='width=device-width, initial-scale=1'><style type='text/css'> body { margin: 0;} </style></head><iframe src='\(link)' width='100%' height='100%' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>", baseURL: nil)
                })

            // If YouTube URL embedded YouTube player
            } else if(url.absoluteString.contains("youtu")) {

                // Fool proof video ID decoding
                let link: String

                let host = "https://www.youtube.com/embed/"
                let query = playsInline ? "?rel=0&playsinline=1" : "?rel=0"
                if (url.host?.contains("youtube.com") ?? false) {
                    link = host + url["v"] + query
                } else if (url.host?.contains("youtu.be") ?? false) {
                    link = host + url.lastPathComponent + query
                } else {
                    link = ""
                }

                DispatchQueue.main.async(execute: { () -> Void in
                    self.loadHTMLString("<head> <meta name=viewport content='width=device-width, initial-scale=1'><style type='text/css'> body { margin: 0;} </style></head><iframe width='100%' height='100%' src='\(link)' frameborder='0' allowfullscreen></iframe>", baseURL: nil)
                })
            }
        }
    }
}
