//
//  DetailViewController.h
//  SOHTaskSDKDemo
//
//  Created by BaiJiangzhou on 16/7/11.
//  Copyright © 2016年 Sohouer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

