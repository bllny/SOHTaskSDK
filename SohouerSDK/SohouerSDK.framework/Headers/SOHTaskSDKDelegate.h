//
//  SOHTaskSDKDelegate.h
//  Sohouer
//
//  Created by BaiJiangzhou on 16/8/30.
//  Copyright © 2016年 com.sohouer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHEAPIManagerCallbackDataReformer <NSObject>
- (id)manager:(id)manager reformData:(NSDictionary *)data;
@end

// api回调
@protocol SHEAPIManagerApiCallBackDelegate <NSObject>
@required
- (void)managerCallAPIDidSuccess:(id)manager;
- (void)managerCallAPIDidFailed:(id)manager;
@end

@protocol SHETaskDownloadDelegate <NSObject>

@optional
- (void) downloaded:(id) task;
- (void) progress:(id) task progress:(CGFloat)progress;
- (void) downloading:(id) task;
- (void) open:(id) task result:(BOOL)result;
- (void) opened:(id) task;
- (void) finish:(id) task;
- (void) cancel:(id) task;

@end



