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
@property (nonatomic) NSDate *currentPodcastersTalkingTime;
@property (nonatomic, readwrite) NSMutableArray *podcasters;
@property (nonatomic) EPTTimer *timer;

@end

@implementation EPTPodcastTimerModel

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount {
    
    
    return [self initWithAmountOfPodcasters:amount withPodcasterFactory:[[EPTPodcasterModelFactory alloc] init] andTimer:[[EPTTimer alloc] init]];
}

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount withPodcasterFactory:(EPTPodcasterModelFactory *)podcasterFactory andTimer:(EPTTimer *)timer {
    if (self = [super init]) {
        self.amountOfPodcasters = amount;
        self.podcasters = [[NSMutableArray alloc] init];
        for (int i=0; i<amount; ++i) {
            EPTPodcasterModel *podcaster = [podcasterFactory podcasterModelWithName:[NSString stringWithFormat:@"Podcaster %i", i+1]];
            [self.podcasters addObject:podcaster];
        }
        self.timer = timer;
    }
    
    return self;
}

- (void)startTimer {
    self.previousDate = [NSDate date];
    self.currentTotalTime = [NSDate dateWithZeroTime];
    self.currentPodcastersTalkingTime = [NSDate dateWithZeroTime];
    [self.timer scheduleTimer];
    self.timer.delegate = self;
    
}

#pragma mark EPTTimerDelegate

- (void)timerFired {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:self.previousDate];
    self.previousDate = currentDate;
    self.currentTotalTime = [self.currentTotalTime dateByAddingTimeInterval:timeInterval];
    self.currentPodcastersTalkingTime = [self.currentPodcastersTalkingTime dateByAddingTimeInterval:timeInterval];
    EPTPodcasterModel *currentPodcaster = self.podcasters[self.currentPodcasterIndex];
    [currentPodcaster addTimeIntervalToTotalTime:timeInterval];
    NSTimeInterval totalTimeInterval = [self.currentTotalTime timeIntervalSinceZeroTime];
    for (EPTPodcasterModel *podcaster in self.podcasters) {
        [podcaster updatePercentageBasedOnTotalTimeInterval:totalTimeInterval];
    }
    
    [self.delegate totalTimeUpdatedTo:[self.currentTotalTime defaultDescription]];
//    [self.delegate currentPodcastersTalkingTimeUpdatedTo:[self.currentPodcastersTalkingTime defaultDescription]];
}

@end
