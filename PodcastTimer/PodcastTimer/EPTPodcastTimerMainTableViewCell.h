//
//  EPTPodcastTimerMainTableViewCell.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/19/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPTPodcastTimerMainTableViewCell : UITableViewCell

@property (nonatomic) NSDate *podcasterTimer;
- (void)setPodcasterTitle:(NSString *)title;

@end
