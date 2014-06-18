//
//  EPTPodcastTimerModelTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EPTPodcastTimerModel.h"
#import "EPTTimer.h"

@interface EPTPodcastTimerModel ()

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount andTimer:(EPTTimer *)timer;

@end

@interface EPTPodcastTimerModelTests : XCTestCase

@property (nonatomic) EPTPodcastTimerModel *testObject;
@property (nonatomic) id timerMock;

@end

@implementation EPTPodcastTimerModelTests

- (void)setUp
{
    [super setUp];
    self.timerMock = [OCMockObject niceMockForClass:EPTTimer.class];
    self.testObject = [[EPTPodcastTimerModel alloc] initWithAmountOfPodcasters:5 andTimer:self.timerMock];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStartTimer_SchedulesTimerCorrectly_andInitializesCurrentTotalTime {
    
    [[self.timerMock expect] scheduleTimer];
    [[self.timerMock expect] setDelegate:self.testObject];
    
    [self.testObject startTimer];
    
    [self.timerMock verify];
    [self.timerMock verify];
    XCTAssertNotNil(self.testObject.currentTotalTime);
}

- (void)testTimerFired_IncreasesTotalTime {
    [self.testObject startTimer];
    NSDate *startDate = [self.testObject.currentTotalTime copy];
    
    [NSThread sleepForTimeInterval:0.1];
    
    [((id<EPTTimerDelegate>)self.testObject) timerFired];
    
    NSDate *finishedDate = self.testObject.currentTotalTime;
    
    NSTimeInterval timeInterval = [finishedDate timeIntervalSinceDate:startDate];
    
    XCTAssertTrue(timeInterval >= 0.1);
    
}

- (void)testTimerFired_IncreasesCurrentPodacstersTotalTime {
    [self.testObject startTimer];
    self.testObject.currentPodcasterIndex = 1;
    NSDate *startDate = [self.testObject.podcasters[1] copy];
    
    [NSThread sleepForTimeInterval:0.1];
    
    [((id<EPTTimerDelegate>)self.testObject) timerFired];
    
    NSDate *finishedDate = self.testObject.podcasters[1];
    
    NSTimeInterval timeInterval = [finishedDate timeIntervalSinceDate:startDate];
    
    XCTAssertTrue(timeInterval >= 0.1);
}

@end
