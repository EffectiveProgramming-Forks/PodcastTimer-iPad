//
//  EPTPodcastTimerMainView.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcastTimerMainView.h"
#import "EPTPodcastTimerMainTableViewCell.h"

@interface EPTPodcastTimerMainView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic) IBOutlet UILabel *currentPodcasterTimerLabel;

@end

@implementation EPTPodcastTimerMainView

-(void)awakeFromNib {
    [self.mainTableView registerNib:[UINib nibWithNibName:@"EPTPodcastTimerMainTableViewCell" bundle:[NSBundle mainBundle]]  forCellReuseIdentifier:@"podcaster cell"];
    
}

- (void)setPodcasters:(NSArray *)podcasters {
    _podcasters = podcasters;
    [self.mainTableView reloadData];
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.mainTableView selectRowAtIndexPath:path animated:NO scrollPosition:0];
}

- (void)timeUpdatedTo:(NSString *)time {
    self.timerLabel.text = [NSString stringWithFormat:@"Total Time: %@", time];
}

- (void)currentPodcasterTimeUpdatedTo:(NSString *)time {
    self.currentPodcasterTimerLabel.text = [NSString stringWithFormat:@"Current Podcaster Timer: %@" , time];
}

#pragma mark UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.podcasters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EPTPodcastTimerMainTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"podcaster cell"];
    
    cell.podcaster = self.podcasters[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate podcasterSelectedAtIndex:indexPath.row];
}



@end
