//
//  EPTPodcasterModelFactory.h
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPTPodcasterModel.h"

@interface EPTPodcasterModelFactory : NSObject

- (EPTPodcasterModel *)podcasterModelWithName:(NSString *)name;

@end
