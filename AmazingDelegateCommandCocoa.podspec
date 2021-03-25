Pod::Spec.new do |spec|

  spec.name         = "AmazingDelegateCommandCocoa"
  spec.version      = "1.0.0"
  spec.summary      = "Delegate command for Swift applied. That's it."

  spec.homepage     = "https://github.com/khamitimur/AmazingCommands"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author    = "Timur Khamidov"

  spec.ios.deployment_target = "11.0"

  spec.source       = { :git => "https://github.com/khamitimur/AmazingDelegateCommand.git", :tag => "#{spec.version}" }

  spec.source_files  = "AmazingDelegateCommandCocoa/**/*.swift"
  
  s.dependency 'AmazingDelegateCommand', '1.0.0'
  
  spec.swift_versions = ['5.0']

end
