Pod::Spec.new do |s|
s.name             = "ZFCustomView"
s.version          = "0.1.1"
s.summary          = "A custom view used on iOS."
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Swift.
DESC
s.homepage         = "https://github.com/zhou415770319/ZFCustomView"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "周飞" => "zhou415770319@163.com" }
s.source           = { :git => "https://github.com/zhou415770319/ZFCustomView.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/NAME'
 
s.platform     = :ios, '7.0'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true
 
s.source_files = 'ZFCustomView/**/*'
# s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
 
end
