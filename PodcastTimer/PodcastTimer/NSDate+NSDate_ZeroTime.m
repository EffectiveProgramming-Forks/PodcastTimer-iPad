//
//  NSDate+NSDate_ZeroTime.m
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "NSDate+NSDate_ZeroTime.h"

@implementation NSDate (NSDate_ZeroTime)

static NSDate *_dateWithZeroTime = nil;

+(NSDate *)dateWithZeroTime {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *startString = @"00:00:00";
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:DateTimeFormatString];
        _dateWithZeroTime = [formatter dateFromString:startString];
    });
    return _dateWithZeroTime;
}

- (NSString *)defaultDescription {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DateTimeFormatString];
    return [formatter stringFromDate:self];
}

- (NSTimeInterval)timeIntervalSinceZeroTime {
    return [self timeIntervalSinceDate:_dateWithZeroTime];
}

@end
