Pod::Spec.new do |s|  

  s.name             = "SXWaveAnimate"  

  s.version          = "1.3.2"

  s.summary          = "An Animate Water view on iOS."  

  s.description      = <<-DESC  

                       It is An Animate Water view on iOS, which implement by Objective-C.  

                       DESC  

  s.homepage         = "https://github.com/dsxNiubility/SXWaveAnimate"  

  # s.screenshots      = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license          = 'MIT'  

  s.author           = { "董尚先” => "dantesx2012@gmail.com" }  

  s.source           = { :git => "https://github.com/dsxNiubility/SXWaveAnimate.git", :tag => s.version.to_s }  

  # s.social_media_url = 'https://twitter.com/董尚先'  

  

  s.platform     = :ios, '8.0' 

  # s.ios.deployment_target = '8.0'

  # s.osx.deployment_target = '10.9'

  s.requires_arc = true  

  

  s.source_files = 'SXWaveAnimate/*'  

  # s.resources = 'Assets'  

  

  # s.ios.exclude_files = 'Classes/osx'  

  # s.osx.exclude_files = 'Classes/ios'  

  # s.public_header_files = 'Classes/**/*.h'  

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'  

  

end
