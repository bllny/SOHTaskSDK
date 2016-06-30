# Inhouse版本使用步骤
一、Cocoapods方式

	 pod 'SOHTask'
	 
二、手动

	放入SOHTask.framework
	依赖
		AdSupport.framework
		JavaScriptCore.framework
		MobileCoreServices.framework
		AFNetorking3.x 
		YYModel
		YYWebImage
		YYText
		YYWebImage
		KVOController
		Masonry
##调用步骤
1. 选择Capabilities中的Background Modes中的Audio,AirPlay And Picture in Picture
2. 初始化SDK,传入AppKey,AppSecret

	```
	[SOHTask registerApp:AppKey withSecret:AppSecret];
	```
3. 调用登录方法, 传入接入方App的用户标识ID。

	```
	[SOHTask login:userID callback:^(BOOL result,NSString * message) {
		if (result ){
			/// 登录成功
		}
	}];
	```
4.  打开任务模块时，请使用
	
	```
	UIViewController * taskListVC = [SOHTask taskViewController];
	[self.navigationController pushViewController:taskListVC animated:YES];
	```  
#注意事项
1. SDK与Aspects冲突，如果需要使用请联系SDK开发者
2. 可以通过 ```[SOHTask isLogin] ``` 方法来判断当前SDK是否登录成功
3. 打开任务模块时必须登录成功，否则打开失败