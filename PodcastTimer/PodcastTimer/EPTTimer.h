//
//  EPTTimer.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  EPTTimerDelegate <NSObject>

- (void)timerFired;

@end

@interface EPTTimer : NSObject

@property (nonatomic) id<EPTTimerDelegate> delegate;

- (void)scheduleTimer;
- (void)stopTimer;

@end
