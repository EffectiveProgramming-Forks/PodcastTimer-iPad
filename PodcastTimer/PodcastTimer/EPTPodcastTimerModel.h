//
//  EPTPodcastTimerModel.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPTPodcasterModelFactory.h"

@protocol EPTPodcastTimerModelDelegate <NSObject>

- (void)totalTimeUpdatedTo:(NSString *)totalTime;

@end

@interface EPTPodcastTimerModel : NSObject

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount;
- (void)startTimer;

@property (nonatomic, readonly) NSMutableArray *podcasters;
@property (nonatomic, readonly) NSDate *currentTotalTime;
@property (nonatomic) NSInteger currentPodcasterIndex;
@property (nonatomic, weak) id<EPTPodcastTimerModelDelegate> delegate;

@end
