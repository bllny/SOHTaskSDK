# Inhouse版本使用步骤
一、Cocoapods方式

	 pod 'SOHTaskSDK'
	 
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
	    [SOHTaskSDK registerSDK:AppKey appSecret:AppSecret delegate:self];
	```
	
3. 调用登录方法, 传入接入方App的用户标识ID。

	```
	[SOHTask login:userID callback:^(BOOL result,NSString * message) {
		if (result ){
			/// 登录成功
		}
	}];
	```
4. Delegate描述：以下回调都在主线程内

	```
	@protocol SOHTaskSDKRegiseterDelegate <NSObject>
	//SDK初始化结果回调
	- (void) registerSuccess;
	- (void) registerFailed:(NSString *)errorMessage;
	@end
	
	@protocol SOHTaskSDKLoginDelegate <NSObject>
	//登录SDK结果回调 
	- (void) loginSuccess;
	- (void) loginFailed:(NSString *)errorMessage;
	@end 
	```
5. 打开任务模块时，请使用
	
	```
	UIViewController * taskListVC = [SOHTask taskViewController];
	[self.navigationController pushViewController:taskListVC animated:YES];
	``` 
	TaskListViewController中 还可以接受 ```kAppLoginSuccessNotifi```通知 来处理先展示界面然后刷新界面。
	
#注意事项
1. SDK与Aspects冲突，如果需要使用请联系SDK开发者
2. 可以通过 ```[SOHTask isLogin] ``` 方法来判断当前SDK是否登录成功
3. SDK初始化成功后，如果在App管理平台设置的使用通过证书来获取UDID,则会自动下载证书跳转回App内，才会发送 SDK初始化成功 消息
4. 除去证书获取UDID方式，暂不支持其他方式获取。