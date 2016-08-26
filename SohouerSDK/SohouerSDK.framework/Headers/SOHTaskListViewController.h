//
//  SOHTaskListViewController.h
//  SohouerMarketing
//
//  Created by BaiJiangzhou on 16/3/17.
//  Copyright © 2016年 com.sohouer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHETaskManager.h"
#import "SHEBaseManager.h"

@protocol SOHTaskSDKTaskListDelegate <NSObject>
- (BOOL) didSelectTaskAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface SOHTaskListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SHETaskDownloadDelegate,SHEAPIManagerApiCallBackDelegate>
@property (nonatomic,weak) id<SOHTaskSDKTaskListDelegate> delegate;
@end
