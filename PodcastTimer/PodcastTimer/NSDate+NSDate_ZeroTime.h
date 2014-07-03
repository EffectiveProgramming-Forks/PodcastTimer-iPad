//
//  NSDate+NSDate_ZeroTime.h
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDate_ZeroTime)

+(NSDate *)dateWithZeroTime;
- (NSString *)defaultDescription;
- (NSTimeInterval)timeIntervalSinceZeroTime;

@end
