Pod::Spec.new do |s|
    s.name         = "SOHTaskSDK"
    s.version      = "0.0.2"
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
    s.dependency 'YYModel'
    s.dependency 'YYText'
    s.dependency 'YYWebImage'
    s.dependency 'KVOController'
    s.dependency 'ZipArchive'
    s.dependency 'Masonry'
end
