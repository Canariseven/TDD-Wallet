//
//  AGTDollarTest.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTDollar.h"
@interface AGTDollarTest : XCTestCase

@end

@implementation AGTDollarTest

-(void)testMultiplication{
    AGTDollar *five = [[AGTDollar alloc] initWithAmount:5];
    AGTDollar *total = [five times:2];
    AGTDollar *ten  = [[AGTDollar alloc] initWithAmount:10];
    XCTAssertEqualObjects(ten, total,@"5$x2 = $10");
}

-(void) testEquality{
    AGTDollar *five = [[AGTDollar alloc]initWithAmount:5];
    AGTDollar *total = [five times:2];
    AGTDollar *ten = [[AGTDollar alloc] initWithAmount:10];
    XCTAssertEqualObjects(ten,total, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects should not be equal");
}



@end
