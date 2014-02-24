Pod::Spec.new do |s|
  s.name         = "JBUtils"
  s.version      = "0.1"
  s.summary      = "A collection of useful objective-c categories."
  s.homepage     = "https://github.com/jbouaziz/JBUtils"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Jonathan Bouaziz" => "jonathan9426@gmail.com" }
  s.source       = { 
    :git => "https://github.com/jbouaziz/JBUtils.git",
    :tag => "0.1"
  }

  s.platform     = :ios, '6.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end