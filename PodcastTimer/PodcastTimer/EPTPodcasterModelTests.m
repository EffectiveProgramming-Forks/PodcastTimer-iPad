//
//  EPTPodcasterModelTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/26/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EPTPodcasterModel.h"

@interface EPTPodcasterModelTests : XCTestCase

@property (nonatomic) EPTPodcasterModel *testObject;
@property (nonatomic) id delegateMock;

@end

@implementation EPTPodcasterModelTests

- (void)setUp
{
    [super setUp];
    self.testObject = [[EPTPodcasterModel alloc] initWithPodcasterName:@"some name"];
    self.delegateMock = [OCMockObject niceMockForProtocol:@protocol(EPTPodcasterModelDelegagte)];
    self.testObject.delegate = self.delegateMock;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddingOneSecond_ToNewModel_CallsDelegateWithCorrectString {
    [[self.delegateMock expect] totalTimeUpdatedTo:@"00:00:01"];
    
    NSTimeInterval interval = 1.0;
    
    [self.testObject addTimeIntervalToTotalTime:interval];
    
    [self.delegateMock verify];
}

- (void)testAddingOneSecondTwice_CallsDelegateWithCorrectString {
    [[self.delegateMock expect] totalTimeUpdatedTo:@"00:00:02"];
    
    NSTimeInterval interval = 1.0;
    
    [self.testObject addTimeIntervalToTotalTime:interval];
    [self.testObject addTimeIntervalToTotalTime:interval];
    
    [self.delegateMock verify];
}


@end
