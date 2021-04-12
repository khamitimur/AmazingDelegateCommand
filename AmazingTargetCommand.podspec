Pod::Spec.new do |spec|

  spec.name         = "AmazingTargetCommand"
  spec.version      = "1.0.1"
  spec.summary      = "A spin on classic Command design pattern with a Swift version of Target-Action design pattern on top."

  spec.homepage     = "https://github.com/khamitimur/AmazingTargetCommand"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author    = "Timur Khamidov"

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.14"
  spec.tvos.deployment_target = "11.0"
  spec.watchos.deployment_target = '4.0'

  spec.source       = { :git => "https://github.com/khamitimur/AmazingTargetCommand.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.swift"
  
  spec.swift_versions = ['5.0']
  
  spec.dependency 'AmazingWeakSequence', '~> 1.0'

end
