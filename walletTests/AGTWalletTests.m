//
//  AGTWalletTests.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"
#import "AGTWallet.h"
@interface AGTWalletTests : XCTestCase
@property (nonatomic, strong) AGTMoney *fiveEuro;
@property (nonatomic, strong) AGTMoney *tenDollars;
@property (nonatomic, strong) AGTMoney *twoEuros;
@property (nonatomic, strong) AGTWallet *wallet;
@end

@implementation AGTWalletTests

- (void)setUp {
    [super setUp];
    self.fiveEuro = [AGTMoney euroWithAmount:5];
    self.twoEuros = [AGTMoney euroWithAmount:2];
    self.tenDollars = [AGTMoney dollarWithAmount:10];
    self.wallet = [[AGTWallet alloc]initWithAmount:5 currency:@"EUR"];
    [self.wallet plus:self.fiveEuro];
    [self.wallet plus:self.twoEuros];
    [self.wallet plus:self.tenDollars];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.fiveEuro = nil;
    self.tenDollars = nil;
    self.twoEuros = nil;
    self.wallet = nil;
}


// 1$ = 2€
-(void) testReduction{
    AGTBroker *broker = [AGTBroker new];
    // Por cuanto tengo que dividir el primero para que me de el segundo
    [broker addRate:1.0/2 fromCurrency:@"USD" toCurrency:@"EUR"];
    AGTMoney * dollar = [AGTMoney dollarWithAmount:1];
    AGTMoney *euro = [dollar reduceToCurrency:@"EUR" withBroker:broker];
    XCTAssertEqualObjects(euro, [AGTMoney euroWithAmount:2],@"1$ = 2€");
}
// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    AGTBroker * broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    AGTWallet * wallet = [[AGTWallet alloc]initWithAmount:40 currency:@"EUR"];
    [wallet plus:[AGTMoney dollarWithAmount:20]];
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100],@"€40 + $20 = $100 2:1");
}
-(void)testNumberOfMoneysByCurrency{
    NSInteger numberMoneys = [self.wallet numberOfMoneysForCurrency:@"EUR"];
    XCTAssertEqual(numberMoneys, 3);
    [self.wallet plus:[AGTMoney euroWithAmount:200]];
    numberMoneys = [self.wallet numberOfMoneysForCurrency:@"EUR"];
    XCTAssertEqual(numberMoneys, 4);
}
@end
