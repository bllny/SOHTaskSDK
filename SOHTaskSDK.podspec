Pod::Spec.new do |s|
    s.name         = "SOHTaskSDK"
    s.version      = "0.1.1"
    s.summary      = "搜猴儿任务管理SDK"
    s.homepage     = "http://www.sohouer.com/fans"
    s.license = { :"type" => "Copyright", :"text" => " Copyright 2016 Sohouer "}
    s.author       = { "jiangzhou" => "jiangzhoubai@gmail.com" }
    s.platform     = :ios, "7.0"
    s.ios.deployment_target = "7.0"
    s.source       = { :git => "https://github.com/bllny/SOHTaskSDK.git", :tag => s.version, :submodules => true }

	s.default_subspec = 'Task'
    s.subspec 'Task' do |ss|
	    ss.dependency 'AFNetworking'
        ss.dependency 'KVOController'
        ss.dependency 'YYModel'
        ss.dependency 'YYText'
        ss.dependency 'YYWebImage'
        ss.dependency 'Masonry'

	    ss.public_header_files	    = 'ZipArchive/*.h'
        
	    ss.vendored_frameworks      = 'SohouerSDK.framework'
	    ss.resource	                = 'SohouerSDK.bundle'
        ss.frameworks	            = 'UIKit','Security','Foundation', 'AdSupport','MobileCoreServices','JavaScriptCore'
	end
    
	s.subspec 'ZipArchive' do |ss|
        ss.source_files = '*.{h,m}', 'minizip/crypt.{h,c}', 'minizip/ioapi.{h,c}', 'minizip/mztools.{h,c}', 'minizip/unzip.{h,c}', 'minizip/zip.{h,c}'
        ss.public_header_files = '*.h'
        ss.library   = 'z'
        ss.requires_arc = false
        ss.compiler_flags = '-Dunix'
    end

    s.subspec 'TaskZip' do |ss|
	    ss.dependency 'SOHTaskSDK/ZipArchive'
	    ss.dependency 'SOHTaskSDK/Task'
    end
end
