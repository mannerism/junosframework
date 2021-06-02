
Pod::Spec.new do |spec|
  spec.name         = "Junos"
  spec.version      = "1.0.0"
  spec.summary      = "Junos framework."
  spec.description  = "Adjustable constraints and UIKit helpers"
  spec.homepage     = "https://github.com/mannerism/junosframework"
  spec.license      = "Beer License"
  spec.author             = { "mannerism" => "dearmannerism@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/mannerism/junosframework.git", :tag => spec.version }
  spec.source_files  = "Junos/**/*.{swift}"
  spec.swift_versions = "5.0"
  #spec.exclude_files = "Classes/Exclude"
end
