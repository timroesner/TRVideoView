Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '9.0'
  s.name = "TRVideoView"
  s.summary = "TRVideoView is a simple drop in WebView for embedded YouTube and Vimeo videos."
  s.requires_arc = true

  # 2
  s.version = "0.1.0"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4 - Replace with your name and e-mail address
  s.author = { "Tim Roesner" => "timroesner@me.com" }

  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/timroesner/TRVideoView"

  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/timroesner/TRVideoView.git", :tag => "#{s.version}"}
  # 7
  s.framework = "UIKit"
  s.framework = "WebKit"

  # 8
  s.source_files = "TRVideoView/**/*.{swift}"

  # 9
  s.resources = "TRVideoView/**/*.{png,jpeg,jpg,storyboard,xib}"
end