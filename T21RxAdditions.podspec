
Pod::Spec.new do |s|

  s.name         = "T21RxAdditions"
  s.version      = "1.0.0"
  s.summary      = "T21RxAdditions"
  s.author    = "Eloi Guzman Ceron"
  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/worldline-spain/T21RxAdditions.git", :tag => "1.0.0" }
  s.source_files  = "Classes", "src/**/*.{swift}"
  s.framework  = "Foundation"
  s.requires_arc = true

  s.dependency "RxSwift"
  s.dependency "RxCocoa"

end
