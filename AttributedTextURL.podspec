Pod::Spec.new do |spec|

  spec.name         = "AttributedTextURL"
  spec.version      = "0.0.1"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This library helps to create AttributedString with one or more links, for layouts containing links in the middle of the text.
                   DESC

  spec.homepage     = "https://github.com/dejacs/AttributedTextURL"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "Jade Silveira" => "jadecs8@gmail.com" }

  spec.platform     = :ios

  spec.source       = { :git => "https://github.com/dejacs/AttributedTextURL", :tag => "#{spec.version}" }
  spec.source_files  = "AttributedTextURL/**/*.{h,m,swift}"
end
