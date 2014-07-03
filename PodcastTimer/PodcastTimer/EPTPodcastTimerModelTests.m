//
//  EPTPodcastTimerModelTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/7/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//
//There are some issues with these tests and making sure that integers are the right values and not just being called.
//This is currently a shortcomming with OCMock

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EPTPodcastTimerModel.h"
#import "EPTTimer.h"
#import "EPTPodcasterModelFactory.h"

@interface EPTPodcastTimerModel ()

- (instancetype)initWithAmountOfPodcasters:(NSInteger)amount withPodcasterFactory:(EPTPodcasterModelFactory *)podcasterFactory andTimer:(EPTTimer *)timer;

@end

@interface EPTPodcastTimerModelTests : XCTestCase

@property (nonatomic) EPTPodcastTimerModel *testObject;
@property (nonatomic) id timerMock;
@property (nonatomic) id podcasterFactoryMock;
@property (nonatomic) id podcasterModelMock;
@property (nonatomic) id<EPTTimerDelegate> timerDelegate;
@property (nonatomic) id delegateMock;

@end

@implementation EPTPodcastTimerModelTests

- (void)setUp
{
    [super setUp];
    self.timerMock = [OCMockObject niceMockForClass:EPTTimer.class];
    [[self.timerMock expect] setDelegate:[OCMArg checkWithBlock:^BOOL(id<EPTTimerDelegate> delegate) {
        self.timerDelegate = delegate;
        return YES;
    }]];
    self.delegateMock = OCMProtocolMock(@protocol(EPTPodcastTimerModelDelegate));
    self.podcasterFactoryMock = [OCMockObject niceMockForClass:EPTPodcasterModelFactory.class];
    self.podcasterModelMock = [OCMockObject niceMockForClass:EPTPodcasterModel.class];
    [[[self.podcasterFactoryMock stub] andReturn:self.podcasterModelMock] podcasterModelWithName:OCMOCK_ANY];
    self.testObject = [[EPTPodcastTimerModel alloc] initWithAmountOfPodcasters:5 withPodcasterFactory:self.podcasterFactoryMock andTimer:self.timerMock];
    self.testObject.delegate = self.delegateMock;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//- (void)tearDown
//{
//    [self.delegateMock stopMocking];
//    [self.podcasterFactoryMock stopMocking];
//    [self.podcasterModelMock stopMocking];
//    [self.timerMock stopMocking];
//    [super tearDown];
//}

- (void)testInit_CreatesCorrectAmountOfPodcasters {
    self.podcasterFactoryMock = [OCMockObject niceMockForClass:EPTPodcasterModelFactory.class];
    [[[self.podcasterFactoryMock expect] andReturn:self.podcasterModelMock ] podcasterModelWithName:@"Podcaster 1"];
    [[[self.podcasterFactoryMock expect] andReturn:self.podcasterModelMock ] podcasterModelWithName:@"Podcaster 2"];
    
    self.testObject = [[EPTPodcastTimerModel alloc] initWithAmountOfPodcasters:2 withPodcasterFactory:self.podcasterFactoryMock andTimer:nil];
    
    OCMVerifyAll(self.podcasterFactoryMock);
}

- (void)testStartTimer_SchedulesTimerCorrectly_andInitializesCurrentTotalTime {
    
    [[self.timerMock expect] scheduleTimer];
    
    [self.testObject startTimer];
    
    OCMVerifyAll(self.timerMock);
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
    self.testObject.currentPodcasterIndex = 1;
    [[[self.podcasterModelMock expect] ignoringNonObjectArgs] addTimeIntervalToTotalTime:0];
    [self.testObject startTimer];
    [self.timerDelegate timerFired];
    
    OCMVerifyAll(self.podcasterModelMock);
}

- (void)testTimerFired_UpdatesDelegateWithNewTime {
    
    OCMExpect([self.delegateMock totalTimeUpdatedTo:@"00:00:01"]);
    
    [self.testObject startTimer];
    [NSThread sleepForTimeInterval:1.0];
    [self.timerDelegate timerFired];
    [self.delegateMock verify];
}

- (void)testTimerFired_TellsAllModelsToUpdatePercentages {
    for (int i =0; i<5; i++) {
        [[[self.podcasterModelMock expect] ignoringNonObjectArgs] updatePercentageBasedOnTotalTimeInterval:0];
    }
    [self.testObject startTimer];
    [NSThread sleepForTimeInterval:0.1];
    [self.timerDelegate timerFired];
    
    OCMVerifyAll(self.podcasterModelMock);
}

//- (void)testCurrentPodcastersTalkingTime_UpdatesWhenTimerFired {
//    [[self.delegateMock expect] currentPodcastersTalkingTimeUpdatedTo:@"00:00:01"];
//    
//    [self.testObject startTimer];
//    [NSThread sleepForTimeInterval:1.0];
//    [self.timerDelegate timerFired];
//    [self.delegateMock verify];
//}
//
//- (void)testCurrentPodcastersTalkingTime_IsResetWhenPodcastersChange {
//    OCMExpect([self.delegateMock currentPodcastersTalkingTimeUpdatedTo:@"00:00:02"]);
//    [self.testObject startTimer];
//    [NSThread sleepForTimeInterval:1.0];
//    [self.timerDelegate timerFired];
//    self.testObject.currentPodcasterIndex = 0;
//    [NSThread sleepForTimeInterval:2.0];
//    [self.timerDelegate timerFired];
//    
//    OCMVerifyAll(self.podcasterModelMock);
//    
//}

@end
