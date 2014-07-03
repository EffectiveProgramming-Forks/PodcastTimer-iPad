//
//  EPTPodcastTimerMainTableViewCell.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/19/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcastTimerMainTableViewCell.h"

@interface EPTPodcastTimerMainTableViewCell () <EPTPodcasterModelDelegagte>

@property (nonatomic) IBOutlet UILabel *podcasterNameLabel;
@property (nonatomic) IBOutlet UILabel *podcasterTimeLabel;

@end

@implementation EPTPodcastTimerMainTableViewCell

- (void)setPodcaster:(EPTPodcasterModel *)podcaster {
    _podcaster = podcaster;
    podcaster.delegate = self;
    self.podcasterNameLabel.text = podcaster.name;
}

#pragma mark EPTPodcasterModelDelegagte

-(void)totalTimeUpdatedTo:(NSString *)dateTimeString {
    self.podcasterTimeLabel.text = dateTimeString;
}

@end
