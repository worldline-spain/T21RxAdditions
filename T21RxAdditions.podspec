Pod::Spec.new do |s|
  s.name			= "T21RxAdditions"
  s.version			= "2.1.0"
  s.summary			= "Simple wrapper class for the RxSwift"
  s.author			= "Eloi Guzman Ceron"
  s.platform			= :ios
  s.ios.deployment_target 	= "10.0"
  s.source       		= { :git => "https://github.com/worldline-spain/T21RxAdditions.git", :tag => s.version }
  s.source_files  		= "Classes", "src/**/*.{swift}"
  s.framework  			= "Foundation"
  s.requires_arc 		= true
  s.homepage			= "https://github.com/worldline-spain/T21RxAdditions"
  s.license 			= "https://github.com/worldline-spain/T21RxAdditions/blob/master/LICENSE"
  s.swift_version           	= '5.0'

  s.dependency 			"RxSwift"
  s.dependency 			"RxCocoa"
end
