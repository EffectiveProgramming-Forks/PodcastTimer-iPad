//
//  EPTPodcasterSelectionView.m
//  PodcastTimer
//
//  Created by Eric Jones on 5/29/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import "EPTPodcasterSelectionView.h"

@interface EPTPodcasterSelectionView ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *numberSelectionSegmentedControl;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation EPTPodcasterSelectionView

- (IBAction)startButtonSelected:(id)sender {
    
    [self.delegate startButtonSelectedWithSelectedAmount:(self.numberSelectionSegmentedControl.selectedSegmentIndex + 2)];
    
}


@end
