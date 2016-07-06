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

	s.default_subspec = 'Task'
    s.subspec 'Task' do |task|
	    task.vendored_frameworks    = 'SohouerSDK.framework'
	    task.resource	            = 'SohouerSDK.bundle'
        task.frameworks             = 'UIKit','Security','Foundation', 'AdSupport','MobileCoreServices','JavaScriptCore'
        task.public_header_files    = 'ZipArchive/*.h'
        task.dependency 'AFNetworking'
        task.dependency 'KVOController'
        task.dependency 'YYModel'
        task.dependency 'YYText'
        task.dependency 'YYWebImage'
        task.dependency 'Masonry'
        task.compiler_flags = '-Dunix'
    end
    
    s.subspec 'TaskZipLib' do |zip|
	    zip.public_header_files     = 'ZipArchive/*.h'
        zip.source_files            = 'ZipArchive/*.{h,m}', 'ZipArchive/minizip/crypt.{h,c}', 'ZipArchive/minizip/ioapi.{h,c}', 'ZipArchive/minizip/mztools.{h,c}', 'ZipArchive/minizip/unzip.{h,c}', 'ZipArchive/minizip/zip.{h,c}'
	    zip.dependency 'SOHTaskSDK/Task'
        zip.library   = 'z'
        zip.compiler_flags = '-Dunix'
    end
end
