//
//  AGTMoneyTests.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 4/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTMoney.h"
@interface AGTMoneyTests : XCTestCase

@end

@implementation AGTMoneyTests

// Test de multiplicación
-(void)testMultiplication{
    AGTMoney * euro = [AGTMoney euroWithAmount:5];
    AGTMoney *ten = [AGTMoney euroWithAmount:10];
    AGTMoney * total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten,@"€5 x 2 should be 10€");
    
    AGTMoney * dollar = [AGTMoney dollarWithAmount:5];
    AGTMoney *tenD = [AGTMoney dollarWithAmount:10];
    AGTMoney * totalD = [dollar times:2];
    
    XCTAssertEqualObjects(totalD, tenD,@"$5 x 2 should be 10$");
    
}

-(void) testEquality{
    AGTMoney *five = [AGTMoney dollarWithAmount:5];
    AGTMoney *total = [five times:2];
    AGTMoney *ten = [AGTMoney dollarWithAmount:10];
    XCTAssertEqualObjects(ten,total, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five],@"Non equivalent objects should not be equal");
    
    
    
}
-(void) testDifferentCurrencies{
    AGTMoney *dollar = [AGTMoney dollarWithAmount:1];
    AGTMoney *euro = [AGTMoney euroWithAmount:1];
    XCTAssertNotEqualObjects(euro, dollar,@"Different currencies should not be equal!");
}

-(void)testHash{
    AGTMoney * a = [AGTMoney euroWithAmount:2];
    AGTMoney *b = [AGTMoney euroWithAmount:2];
    XCTAssertEqual([a hash], [b hash],@"Equal objects must have same hash");
    AGTMoney * c = [AGTMoney dollarWithAmount:2];
    AGTMoney * d = [AGTMoney dollarWithAmount:2];
    XCTAssertEqual([c hash], [d hash],@"Equal objects must have same hash");
}

-(void) testAmountStorage{
    AGTMoney * euro = [AGTMoney euroWithAmount:2];
    AGTMoney * dollar = [AGTMoney dollarWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the stored");
        XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue],@"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
}
-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[AGTMoney euroWithAmount:1] currency],@"The currency of euros should be EUR");
      XCTAssertEqualObjects(@"USD", [[AGTMoney dollarWithAmount:1] currency],@"The currency of dollar should be USD");
}

-(void)testSimpleAddition{
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus: [AGTMoney dollarWithAmount:5]];
    XCTAssertEqualObjects(sum, [AGTMoney dollarWithAmount:10],@"$5 + $5 = $10");
}
-(void)testThatHashIsAmount{
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    XCTAssertEqual([one hash],1, @"The hash must be the same as the amount");
}
-(void)testDescription{
    AGTMoney *one =[AGTMoney dollarWithAmount:1];
    NSString *desc = @"<AGTMoney: USD 1>";
    XCTAssertEqualObjects(desc, [one description],@"Description match template");
}

@end
