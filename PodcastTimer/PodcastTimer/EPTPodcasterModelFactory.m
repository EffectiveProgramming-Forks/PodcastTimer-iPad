//
//  EPTPodcasterModelFactory.m
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcasterModelFactory.h"

@implementation EPTPodcasterModelFactory

- (EPTPodcasterModel *)podcasterModelWithName:(NSString *)name {
    return [[EPTPodcasterModel alloc] initWithPodcasterName:name];
}

@end
