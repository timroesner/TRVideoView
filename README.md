# TRVideoView

This is a simple drop in WKWebView for embedded videos from YouTube and vimeo.

## Features 
* Provide a text and get back a WKWebView
* Check if text has links
* Return string without links
* Resize WebView
<img width="343" alt="screen shot 2017-09-21 at 1 47 28 pm" src="https://user-images.githubusercontent.com/13894518/30718059-9982f632-9ed3-11e7-9169-7e9a5f7244ca.png">
<img width="337" alt="screen shot 2017-09-21 at 1 48 26 pm" src="https://user-images.githubusercontent.com/13894518/30718060-998a12aa-9ed3-11e7-9158-7a86426c4ab6.png">

## Requierments
* iOS 9.0
* Swift 4.0
* Xcode 9 

## Installation  
### CocoaPods

To integrate this into your Xcode project using [CocoaPods](https://cocoapods.org), add it to your `Podfile`:

```ruby
pod 'TRVideoView'
```

Then, run the following command:

```bash
$ pod install
```

## Usage  
```swift
// Initialize  
let video = TRVideoView(text: "This is some sample text with a YouTube link https://www.youtube.com/watch?v=QPAloq5MCUA")  

// Set frame with this method
video.frame(x: 0, y: 0, width: 300, height: 150)

// Returns true or false (checks for YouTube and Vimeo urls)
video.containsURLs()

// Returns String with out URLs (i.e. "This is some sample text with a YouTube link")
let text = video.textWithoutURLs()

// Finally add it to your view
self.view.addSubview(video)
```

## Notes on links
For YouTube either `https://youtu.be/QPAloq5MCUA` or `https://www.youtube.com/watch?v=QPAloq5MCUA` works.  
For Vimeo use `https://vimeo.com/86033976`  
Make sure no other parameters are included after the video id otherwise the video won't be found.

## Contributing 
Want to see other video services supported? You can open an issue and I will see what I can do.  
If you would like to fork this project and add more features, go ahead and make a PR, I'm happy about your contributions. 
