//
//  AGTEuroTests.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTEuro.h"
@interface AGTEuroTests : XCTestCase

@end

@implementation AGTEuroTests

// Test de multiplicación
-(void)testMultiplication{
    AGTEuro * euro = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *ten = [[AGTEuro alloc]initWithAmount:10];
    AGTEuro * total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten,@"€5 x 2 should be 10");
}

-(void)testEquality{
    //Dos objetos que representan la misma cantidad, pero que se obtienen de diferente forma
    AGTEuro *five = [[AGTEuro alloc]initWithAmount:5];
    AGTEuro *ten = [[AGTEuro alloc]initWithAmount:10];
    AGTEuro *total = [five times:2];
    XCTAssertEqualObjects(ten, total,@"Equivalent objects shoudl be equal!");
}

@end
