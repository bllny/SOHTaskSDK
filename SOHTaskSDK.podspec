Pod::Spec.new do |s|
    s.name         = "SOHTaskSDK"
    s.version      = "0.0.8"
    s.summary      = "搜猴儿任务管理SDK"
    s.homepage     = "http://www.sohouer.com/fans"
    s.license = { :"type" => "Copyright", :"text" => " Copyright 2016 Sohouer "}
    s.author       = { "jiangzhou" => "jiangzhoubai@gmail.com" }
    s.platform     = :ios, "7.0"
    s.ios.deployment_target = "7.0"
    s.source       = { :git => "https://github.com/bllny/SOHTaskSDK.git", :tag => s.version.to_s }
    s.vendored_frameworks = 'SohouerSDK.framework'
    s.resources    = 'SohouerSDK.bundle'
    s.frameworks   = 'UIKit','Security','Foundation', 'AdSupport','MobileCoreServices','JavaScriptCore'

    s.dependency 'AFNetworking'
    s.dependency 'KVOController'

    s.subspec 'UI' do |ui|
        ui.dependency 'YYModel'
        ui.dependency 'YYText'
        ui.dependency 'YYWebImage'
        ui.dependency 'Masonry'
    end
    
    s.subspec 'Zip' do |zip|
        zip.dependency 'ZipArchive'
    end
end
