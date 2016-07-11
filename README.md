# 使用步骤
一、Cocoapods方式

	 pod 'SOHTaskSDK'
	 
二、手动  

放入SOHTask.framework  
依赖    

* AdSupport.framework
* JavaScriptCore.framework  
* MobileCoreServices.framework		
* AVFoundation.framework
* [AFNetorking3.x](https://github.com/AFNetworking/AFNetworking)
* [YYModel](https://github.com/ibireme/YYModel)
* [YYText](https://github.com/ibireme/YYText)
* [YYWebImage](https://github.com/ibireme/YYWebImage)
* [KVOController](https://github.com/facebook/KVOController)
* [Masonry](https://github.com/SnapKit/Masonry)

##调用步骤
1. 选择Capabilities中的Background Modes中的Audio,AirPlay And Picture in Picture
2. 导入头文件 ``` #import <SohouerSDK/SOHTaskSDK.h> ```
3. 初始化SDK,传入AppKey,AppSecret

	```
	    [SOHTaskSDK registerSDK:AppKey appSecret:AppSecret delegate:self];
	```
	
4. 调用登录方法, 传入接入方App的用户标识ID。

	```
	[SOHTaskSDK login:platformUserId name:platformUserNickName delegate:self];
	```
5. Delegate描述：以下回调都在主线程内

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
6. 打开任务模块时，请使用
	
	```
	UIViewController * taskListVC = [SOHTaskSDK taskListViewController];
	[self.navigationController pushViewController:taskListVC animated:YES];
	``` 
	TaskListViewController中 还可以接受 ```kAppLoginSuccessNotifi```通知 来处理先展示界面然后刷新界面。
	
#注意事项
1. SDK与Aspects冲突，如果需要使用请联系SDK开发者
2. 可以通过 ```[SOHTaskSDK isLogin] ``` 方法来判断当前SDK是否登录成功
3. SDK初始化成功后，如果在App管理平台设置的使用通过证书来获取UDID,则会自动下载证书跳转回App内，才会发送 SDK初始化成功 消息
4. 请在 AppDelegate 里 实现 ```UIApplicationDelegate```协议中的5个方法

```
- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options {
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return YES;
}
```