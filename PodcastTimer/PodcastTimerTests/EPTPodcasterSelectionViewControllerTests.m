//
//  EPTPodcasterSelectionViewControllerTests.m
//  PodcastTimer
//
//  Created by Eric Jones on 6/4/14.
//  Copyright (c) 2014 Effective Programming. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EPTPodcasterSelectionViewController.h"

@interface EPTPodcasterSelectionViewControllerTests : XCTestCase

@property (nonatomic) EPTPodcasterSelectionViewController *testObject;

@end

@implementation EPTPodcasterSelectionViewControllerTests

- (void)setUp
{
    [super setUp];
    self.testObject = [[EPTPodcasterSelectionViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
