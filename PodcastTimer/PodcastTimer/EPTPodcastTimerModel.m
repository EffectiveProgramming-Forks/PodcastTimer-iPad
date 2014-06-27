//
//  EPTPodcastTimerModel.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcastTimerModel.h"
#import "EPTTimer.h"
#import "EPTPodcasterModel.h"

@interface EPTPodcastTimerModel () <EPTTimerDelegate>

@property (nonatomic) NSDate *previousDate;
@property (nonatomic) NSInteger amountOfPodcasters;
@property (nonatomic, readwrite) NSDate *currentTotalTime;
@property (nonatomic, readwrite) NSMutableArray *podcasters;
@property (nonatomic) EPTTimer *timer;

@end

@implementation EPTPodcastTimerModel

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount {
    
    
    return [self initWithAmountOfPodcasters:amount andTimer:[[EPTTimer alloc] init]];
}
- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount andTimer:(EPTTimer *)timer {
    if (self = [super init]) {
        self.amountOfPodcasters = amount;
        self.podcasters = [[NSMutableArray alloc] init];
        for (int i=0; i<amount; ++i) {
            [self.podcasters addObject:[[EPTPodcasterModel alloc] initWithPodcasterName:[NSString stringWithFormat:@"Podcaster %i", i+1]]];
        }
        self.timer = timer;
    }
    
    return self;
}

- (void)startTimer {
    self.previousDate = [NSDate date];
    self.currentTotalTime = [[NSDate alloc] init];
    [self.timer scheduleTimer];
    self.timer.delegate = self;
    
}

#pragma mark EPTTimerDelegate

- (void)timerFired {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.previousDate];
    self.previousDate = currentDate;
    self.currentTotalTime = [self.currentTotalTime dateByAddingTimeInterval:timeInterval];
    EPTPodcasterModel *currentPodcaster = self.podcasters[self.currentPodcasterIndex];
    [currentPodcaster addTimeIntervalToTotalTime:timeInterval];
    
    
    
}

@end
