//
//  AudioManager.h
//  CrazyPlay
//
//  Created by ruandao on 16/1/26.
//  Copyright © 2016年 hmx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SOHAudioManager : NSObject

@property (assign, nonatomic, readonly) BOOL isPlaying;

- (instancetype) initWithName:(NSString *)name;

- (void)play;

- (void)stop;

@end
