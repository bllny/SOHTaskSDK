//
//  SOHTask.h
//  Sohouer
//
//  Created by BaiJiangzhou on 16/6/16.
//  Copyright © 2016年 com.sohouer. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<SohouerSDK/SOHTaskSDK.h>)
FOUNDATION_EXPORT const unsigned char SohouerSDKVersionString[];
FOUNDATION_EXPORT double SohouerSDKVersionNumber;

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import <YYModel/YYModel.h>
#import <YYWebImage/YYWebImage.h>
#import <KVOController/KVOController.h>
#import <Masonry/Masonry.h>
#import <SohouerSDK/SOHAudioManager.h>
#import <SohouerSDK/SOHTaskListViewController.h>

#else

#import "YYModel.h"
#import "YYWebImage.h"
#import "FBKVOController.h"
#import "Masonry.h"
#import "SOHAudioManager.h"
#import "SOHTaskListViewController.h"

#endif


@class SOHTaskListViewController;

@protocol SOHTaskSDKRegiseterDelegate <NSObject>

- (void) registerSuccess;
- (void) registerFailed:(NSString *)errorMessage;

@end

@protocol SOHTaskSDKLoginDelegate <NSObject>

- (void) loginSuccess;
- (void) loginFailed:(NSString *)errorMessage;

@end




@interface SOHTaskSDK : NSObject

+ (void) registerSDK:(NSString *)appkey appSecret:(NSString *)appSecret delegate:(__weak id<SOHTaskSDKRegiseterDelegate>)delegate;


+ (void) login:(NSString *) platformUserId name:(NSString *)name delegate:(__weak id<SOHTaskSDKLoginDelegate>)delegate;

/**
 *  是否登录成功
 *
 *  @return <#return value description#>
 */
+ (BOOL) isLogin;

/**
 *  登录成功后可以
 *
 *  @return <#return value description#>
 */
+ (NSNumber *) userLevel;


+ (BOOL) isHasUdid;

/**
 *  判断bundleID是否安装
 *
 *  @param bundleID <#bundleID description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) appIsInstalled:(NSString *)bundleID;


+ (void) reloadScript:(NSString *)scriptPath;

/**
 *  任务列表Controller
 *
 *  @return <#return value description#>
 */
+ (SOHTaskListViewController *) taskListViewController;

+ (void) setDebugMode:(BOOL) debug;

+ (NSNumber *) sdkVersion;

@end


@interface SOHTaskSDK (UI)

+ (void) setNavgationBGColor:(UIColor *)color;
+ (void) setNavgationBackColor:(UIColor *)color;
+ (void) setNavgationTitleColor:(UIColor *)color;

@end
