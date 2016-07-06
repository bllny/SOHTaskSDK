Pod::Spec.new do |s|
    s.name         = "SOHTaskSDK"
    s.version      = "0.1.1"
    s.summary      = "搜猴儿任务管理SDK"
    s.homepage     = "http://www.sohouer.com/fans"
    s.license = { :"type" => "Copyright", :"text" => " Copyright 2016 Sohouer "}
    s.author       = { "jiangzhou" => "jiangzhoubai@gmail.com" }
    s.platform     = :ios, "7.0"
    s.ios.deployment_target = "7.0"
    s.source       = { :git => "https://github.com/bllny/SOHTaskSDK.git", :tag => s.version.to_s }

	s.default_subspec = 'Core'
    s.subspec 'Core' do |core|
	    core.vendored_frameworks = 'SohouerSDK.framework'
	    core.resource = 'SohouerSDK.bundle'
        core.frameworks   = 'UIKit','Security','Foundation', 'AdSupport','MobileCoreServices','JavaScriptCore'
        core.dependency 'AFNetworking'
        core.dependency 'KVOController'
    end

    s.subspec 'UI' do |ui|
	    ui.dependency 'SOHTaskSDK/Core'
        ui.source_files = 'ZipArchive/*.h', 'ZipArchive/minizip/crypt.h', 'ZipArchive/minizip/ioapi.h', 'ZipArchive/minizip/mztools.h', 'ZipArchive/minizip/unzip.h', 'ZipArchive/minizip/zip.h'
        ui.dependency 'YYModel'
        ui.dependency 'YYText'
        ui.dependency 'YYWebImage'
        ui.dependency 'Masonry'
    end
    
    s.subspec 'Zip' do |zip|
    	zip.dependency 'SOHTaskSDK/Core'
        zip.source_files = 'ZipArchive/*.{h,m}', 'ZipArchive/minizip/crypt.{h,c}', 'ZipArchive/minizip/ioapi.{h,c}', 'ZipArchive/minizip/mztools.{h,c}', 'ZipArchive/minizip/unzip.{h,c}', 'ZipArchive/minizip/zip.{h,c}'
    end
end
