# TRVideoView

This is a simple drop in WKWebView for embedded videos from YouTube and vimeo.

## Features 
* Provide a text and get back a WKWebView
* Check if text has links
* Return string without links
* Resize WebView
<img width="343" alt="screen shot 2017-09-21 at 1 47 28 pm" src="https://user-images.githubusercontent.com/13894518/33790931-bc11a394-dc39-11e7-8f87-7eeb68aa5d01.png">
<img width="337" alt="screen shot 2017-09-21 at 1 48 26 pm" src="https://user-images.githubusercontent.com/13894518/33790932-bea56f8c-dc39-11e7-9152-d8825a8098eb.png">

## Requierments
* iOS 9.0
* Swift 3.2
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

// Set the frame as always
video.frame = CGRect(x: 0, y: 0, width: 300, height: 150)

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
If other parameters are also included in the link it does not matter, they are sorted out.

## Contributing 
Want to see other video services supported? You can open an issue and I will see what I can do.  
If you would like to fork this project and add more features, go ahead and make a PR, I'm happy about your contributions. 
