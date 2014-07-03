//
//  NSDate+NSDate_ZeroTime.m
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "NSDate+NSDate_ZeroTime.h"

@implementation NSDate (NSDate_ZeroTime)

+(NSDate *)dateWithZeroTime {
    NSString *startString = @"00:00:00";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DateTimeFormatString];
    return [formatter dateFromString:startString];
}

- (NSString *)defaultDescription {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:DateTimeFormatString];
    return [formatter stringFromDate:self];
}

@end
