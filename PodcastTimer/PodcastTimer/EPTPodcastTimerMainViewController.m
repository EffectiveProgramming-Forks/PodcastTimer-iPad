//
//  EPTPodcastTimerMainViewController.m
//  PodcastTimer
//
//  Created by Eric Jones on 5/30/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcastTimerMainViewController.h"
#import "EPTPodcastTimerMainView.h"
#import "EPTPodcastTimerModel.h"

@interface EPTPodcastTimerMainViewController () <EPTPodcastTimerModelDelegate, EPTPodcastTimerMainViewDelegate>

@property (nonatomic) EPTPodcastTimerModel *model;
@property (nonatomic) EPTPodcastTimerMainView *mainView;

@end

@implementation EPTPodcastTimerMainViewController

- (void)setupModel:(EPTPodcastTimerModel *)model andView:(EPTPodcastTimerMainView *)view {
    self.mainView = view;
    self.mainView.delegate = self;
    self.model = model;
    self.model.delegate = self;
    self.mainView.podcasters = self.model.podcasters;
    [self.model startTimer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    EPTPodcastTimerModel *model = [[EPTPodcastTimerModel alloc] initWithAmountOfPodcasters:self.amountOfPodcasters];
    [self setupModel:model andView:(EPTPodcastTimerMainView *)self.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark EPTPodcastTimerModelDelegate

-(void)totalTimeUpdatedTo:(NSString *)totalTime {
    [self.mainView timeUpdatedTo:totalTime];
}

#pragma mark EPTPodcastTimerMainViewDelegate

- (void)podcasterSelectedAtIndex:(NSInteger)index {
    self.model.currentPodcasterIndex = index;
}

- (void)currentPodcastersTalkingTimeUpdatedTo:(NSString *)talkingTime {
    
}


@end
