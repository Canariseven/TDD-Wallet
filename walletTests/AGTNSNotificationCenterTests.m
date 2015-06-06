//
//  AGTNSNotificationCenterTests.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 6/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTFakeNotificationCenter.h"
#import "AGTWallet.h"
@interface AGTNSNotificationCenterTests : XCTestCase

@end

@implementation AGTNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testThatSubscribesToMemoryWarning{
    AGTFakeNotificationCenter *fake = [AGTFakeNotificationCenter new];
    AGTWallet  * fat = [AGTWallet new];
    [fat subscribeToMemoryWarning:(NSNotificationCenter *)fake];
    
    NSDictionary *obs =[fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    XCTAssertEqualObjects(observer, fat, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
