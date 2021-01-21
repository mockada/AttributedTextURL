Pod::Spec.new do |spec|

  spec.name         = "AttributedTextURL"
  spec.version      = "0.0.3"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This library helps to create AttributedString with one or more links, for layouts containing links in the middle of the text.
                   DESC

  spec.homepage     = "https://github.com/dejacs/AttributedTextURL"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Jade Silveira" => "jadecs8@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.1"

  spec.source       = { :git => "https://github.com/dejacs/AttributedTextURL.git", :tag => "#{spec.version}" }
  spec.source_files  = "AttributedTextURL/**/*.{h,m,swift}"

  spec.documentation_url = "https://github.com/dejacs/AttributedTextURL/blob/main/README.md"

end
