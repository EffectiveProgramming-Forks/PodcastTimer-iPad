//
//  EPTPodcastTimerMainViewControllerTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 7/2/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EPTPodcastTimerMainViewController.h"
#import "EPTPodcastTimerMainView.h"
#import "EPTPodcastTimerModel.h"

@interface EPTPodcastTimerMainViewController ()

- (void)setupModel:(EPTPodcastTimerModel *)model andView:(EPTPodcastTimerMainView *)view;

@end

@interface EPTPodcastTimerMainViewControllerTests : XCTestCase {
 
    id modelMock;
    id viewMock;
    id<EPTPodcastTimerModelDelegate> modelDelegate;
    id<EPTPodcastTimerMainViewDelegate> viewDelegate;
    EPTPodcastTimerMainViewController *testObject;
    
}
@end

@implementation EPTPodcastTimerMainViewControllerTests

- (void)setUp
{
    [super setUp];
    modelMock = mock(EPTPodcastTimerModel.class);
    viewMock = mock(EPTPodcastTimerMainView.class);
    testObject = [[EPTPodcastTimerMainViewController alloc] init];
    [[modelMock expect] setDelegate:[OCMArg checkWithBlock:^BOOL(id<EPTPodcastTimerModelDelegate> delegate) {
        modelDelegate = delegate;
        return YES;
    }]];
    [[viewMock expect] setDelegate:[OCMArg checkWithBlock:^BOOL(id<EPTPodcastTimerMainViewDelegate> delegate) {
        viewDelegate = delegate;
        return YES;
    }]];
    [testObject setupModel:modelMock andView:viewMock];
    
}

- (void)testSetup_SetsPodcastersOnView_FromModel {
    NSArray *someArray = [[NSArray alloc] init];
    
    [[[modelMock expect] andReturn:someArray] podcasters];
    
    [[viewMock expect] setPodcasters:someArray];
    
    [testObject setupModel:modelMock andView:viewMock];
    
    OCMVerifyAll(modelMock);
    OCMVerifyAll(viewMock);
}

- (void)testSetup_StartsTimer_OnModel {
    [[modelMock expect] startTimer];
    
    [testObject setupModel:modelMock andView:viewMock];
    
    OCMVerifyAll(modelMock);
}

- (void)testTimeUpdated_SetsTimeOnView {
    NSString *newTime = @"00:00:79";
    
    [modelDelegate totalTimeUpdatedTo:newTime];
    
    OCMVerify([viewMock timeUpdatedTo:newTime]);
}

- (void)testPodcasterSelected_UpdatesModel {
    [viewDelegate podcasterSelectedAtIndex:1];
    
    OCMVerify([modelMock setCurrentPodcasterIndex:1]);
}


@end
