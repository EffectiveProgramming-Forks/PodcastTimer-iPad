//
//  EPTPodcastTimerMainTableViewCell.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/19/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcastTimerMainTableViewCell.h"

@interface EPTPodcastTimerMainTableViewCell ()

@property (nonatomic) IBOutlet UILabel *podcasterNameLabel;
@property (nonatomic) IBOutlet UILabel *podcasterTimeLabel;

@end

@implementation EPTPodcastTimerMainTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
