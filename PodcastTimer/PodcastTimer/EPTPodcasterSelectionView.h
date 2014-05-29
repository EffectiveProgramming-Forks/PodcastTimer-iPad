//
//  EPTPodcasterSelectionView.h
//  PodcastTimer
//
//  Created by Eric Jones on 5/29/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EPTPodcasterSelectionViewDelegate <NSObject>

- (void)startButtonSelectedWithSelectedAmount:(NSInteger)amount;

@end

@interface EPTPodcasterSelectionView : UIView

@property (nonatomic, weak) id<EPTPodcasterSelectionViewDelegate> delegate;

@end
