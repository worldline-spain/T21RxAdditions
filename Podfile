#sources
source 'https://github.com/CocoaPods/Specs.git'

workspace 't21_rxadditions_ios'
project 't21_rxadditions_ios'

target 't21_rxadditions_ios' do
    #Dependencies for the primary target (the main app or the main library)
    use_frameworks!

    pod 'RxSwift'
    pod 'RxCocoa'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
        end
    end
end
