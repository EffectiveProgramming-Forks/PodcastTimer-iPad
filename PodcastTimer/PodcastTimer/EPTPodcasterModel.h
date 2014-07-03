//
//  EPTPodcasterModel.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/19/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EPTPodcasterModelDelegagte <NSObject>

- (void)totalTimeUpdatedTo:(NSString *)dateTimeString;

@end

@interface EPTPodcasterModel : NSObject

@property (nonatomic, weak) id<EPTPodcasterModelDelegagte> delegate;
@property (nonatomic, readonly) NSString *name;

- (instancetype)initWithPodcasterName:(NSString *)name;
- (void)addTimeIntervalToTotalTime:(NSTimeInterval)timeInterval;
- (void)updatePercentageBasedOnTotalTime:(NSDate *)totalTime;

@end
