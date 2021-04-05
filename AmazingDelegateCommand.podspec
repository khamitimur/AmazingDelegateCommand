Pod::Spec.new do |spec|

  spec.name         = "AmazingDelegateCommand"
  spec.version      = "1.2.0"
  spec.summary      = "Delegate command for Swift. That's it."

  spec.homepage     = "https://github.com/khamitimur/AmazingDelegateCommand"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author    = "Timur Khamidov"

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.14"
  spec.tvos.deployment_target = "11.0"
  spec.watchos.deployment_target = '4.0'

  spec.source       = { :git => "https://github.com/khamitimur/AmazingDelegateCommand.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.swift"
  
  spec.swift_versions = ['5.0']
  
  spec.dependency 'AmazingWeakSequence', '~> 1.0'

end
