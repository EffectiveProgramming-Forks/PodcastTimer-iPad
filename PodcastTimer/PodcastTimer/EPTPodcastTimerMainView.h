//
//  EPTPodcastTimerMainView.h
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EPTPodcastTimerMainViewDelegate <NSObject>

- (void)podcasterSelectedAtIndex:(NSInteger)index;

@end

@interface EPTPodcastTimerMainView : UIView

@property (nonatomic, weak) id<EPTPodcastTimerMainViewDelegate> delegate;
@property (nonatomic) NSArray *podcasters;

- (void)timeUpdatedTo:(NSString *)time;

@end
