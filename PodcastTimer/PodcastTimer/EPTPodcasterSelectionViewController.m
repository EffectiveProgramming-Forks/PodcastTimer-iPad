//
//  ESSViewController.m
//  PodcastTimer
//
//  Created by Eric Jones on 5/29/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcasterSelectionViewController.h"
#import "EPTPodcasterSelectionView.h"
#import "EPTPodcastTimerMainViewController.h"


@interface EPTPodcasterSelectionViewController () <EPTPodcasterSelectionViewDelegate>

@property (nonatomic) NSInteger amountOfPodcasters;

@end

@implementation EPTPodcasterSelectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ((EPTPodcasterSelectionView *)self.view).delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"podcasters selected segue"]) {
        EPTPodcastTimerMainViewController *controller = segue.destinationViewController;
        controller. amountOfPodcasters = self.amountOfPodcasters;
        
    }
}

#pragma mark EPTPodcasterSelectionViewDelegate

- (void)startButtonSelectedWithSelectedAmount:(NSInteger)amount {
    self.amountOfPodcasters = amount;
    [self performSegueWithIdentifier:@"podcasters selected segue" sender:self];
}

@end
