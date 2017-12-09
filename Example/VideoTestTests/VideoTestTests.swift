//
//  VideoTestTests.swift
//  VideoTestTests
//
//  Created by Tim Roesner on 9/20/17.
//  Copyright © 2017 Tim Roesner. All rights reserved.
//

import XCTest
@testable import TRVideoView

class VideoTestTests: XCTestCase {
    
    var videoView: TRVideoView!
    
    override func setUp() {
        super.setUp()
        videoView = TRVideoView(text: "Some Link and Text https://www.youtube.com/watch?v=QPAloq5MCUA")
    }
    
    func testContainsURLs() {
        assert(videoView.containsURLs())
    }
    
    func testTextWithoutLink() {
        assert(videoView.text.count > videoView.textWithoutURLs().count)
    }
    
}
