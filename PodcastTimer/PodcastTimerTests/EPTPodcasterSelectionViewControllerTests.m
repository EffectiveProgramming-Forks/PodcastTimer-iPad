//
//  EPTPodcasterSelectionViewControllerTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/4/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EPTPodcasterSelectionViewController.h"
#import "EPTPodcasterSelectionView.h"
#import "EPTPodcastTimerMainViewController.h"

@interface EPTPodcasterSelectionViewControllerTests : XCTestCase

@property (nonatomic) EPTPodcasterSelectionViewController *testObject;
@property (nonatomic) id partialTestObject;
@property (nonatomic) NSString *segueIdentifier;
@property (nonatomic) UIStoryboard *mainStoryBoard;

@end

@implementation EPTPodcasterSelectionViewControllerTests

- (void)setUp
{
    [super setUp];
    self.mainStoryBoard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    self.testObject = [self.mainStoryBoard instantiateViewControllerWithIdentifier: @"EPTPodcasterSelectionScreen"];
    self.partialTestObject = [OCMockObject partialMockForObject:self.testObject];
    self.segueIdentifier = @"podcasters selected segue";
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStartButtonSelected_callsPerformSegue {
    [[self.partialTestObject expect] performSegueWithIdentifier:[OCMArg checkWithBlock:^BOOL(NSString *identifier) {
        return [self.segueIdentifier isEqualToString:identifier];
    }] sender:OCMOCK_ANY];
    
    
    [((id<EPTPodcasterSelectionViewDelegate>)self.testObject) startButtonSelectedWithSelectedAmount:5];
}

- (void)testPrepareForSegueue_setsAmountSelected_onDestinationViewController {
    EPTPodcastTimerMainViewController *destinationController = [self.mainStoryBoard instantiateViewControllerWithIdentifier: @"EPTPodcastTimerScreen"];
    
    //Stub out this method so that when its called, the OS does not try to actually perform a segue, which was causing exceptions.
    [[[self.partialTestObject stub] andCall:@selector(dummyMethod) onObject:self] performSegueWithIdentifier:OCMOCK_ANY sender:OCMOCK_ANY];
    
    [((id<EPTPodcasterSelectionViewDelegate>)self.testObject) startButtonSelectedWithSelectedAmount:5];
    
    UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:self.segueIdentifier source:self.testObject destination:destinationController];
    
    
    
    [self.testObject prepareForSegue:segue sender:nil];
    
    XCTAssertTrue(destinationController.amountOfPodcasters == 5);
    
}

- (void)dummyMethod {
    
}

@end
