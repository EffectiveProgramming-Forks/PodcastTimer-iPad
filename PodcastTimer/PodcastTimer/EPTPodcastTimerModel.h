//
//  EPTPodcastTimerModel.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPTPodcastTimerModel : NSObject

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount;
- (void)startTimer;

@property (nonatomic, readonly) NSMutableArray *podcasters;
@property (nonatomic, readonly) NSDate *currentTotalTime;
@property (nonatomic) NSInteger currentPodcasterIndex;

@end
