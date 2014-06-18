//
//  EPTTimer.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTTimer.h"

@interface EPTTimer ()

@property (nonatomic) NSTimer *timer;

@end

@implementation EPTTimer

- (void)scheduleTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
}

- (void)updateTimer {
    [self.delegate timerFired];
}

- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

@end
