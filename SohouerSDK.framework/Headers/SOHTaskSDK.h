//
//  SOHTask.h
//  Sohouer
//
//  Created by BaiJiangzhou on 16/6/16.
//  Copyright © 2016年 com.sohouer. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT const unsigned char SohouerSDKVersionString[];
FOUNDATION_EXPORT double SohouerSDKVersionNumber;


#import "SHESDKUser.h"
#import "NSString+SOHAdd.h"
#import "SOHCategories.h"
#import "NSObject+YYModel.h"
#import "UIImageView+YYWebImage.h"
#import "NSObject+FBKVOController.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

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


+ (void) login:(NSString *) platformUserId  delegate:(__weak id<SOHTaskSDKLoginDelegate>)delegate;

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

/**
 *  任务列表Controller
 *
 *  @return <#return value description#>
 */
+ (SOHTaskListViewController *) taskListViewController;

+ (NSNumber *) sdkVersion;

+ (void) handleUrl:(NSURL *)url;

@end


@interface SOHTaskSDK (UI)

@property (nonatomic,strong) UIColor * navgationBGColor;

@end
