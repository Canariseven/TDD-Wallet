//
//  AGTControllerTests.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 6/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"
@interface AGTControllerTests : XCTestCase
@property (nonatomic, strong) AGTWalletTableViewController *walletVC;
@property (nonatomic, strong) AGTWallet *wallet;
@property (nonatomic, strong) AGTSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@end

@implementation AGTControllerTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno de laboratorio
    self.simpleVC = [[AGTSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    self.wallet = [[AGTWallet alloc]initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    self.walletVC = [[AGTWalletTableViewController alloc]initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    // Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    
}

-(void)testThatTextOnLabelIsEqualToTextOnButton{
    
    // mandamos el mensaje
    [self.simpleVC displayText:self.button];
    // comprobamos que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text,@"Button and label should have the same text");
}

//-(void) testThatTableHasOneSection{
//    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
//    XCTAssertEqual(sections,1,@"The can only be one");
//    
//}
//-(void)testThatNumberOfCellsIsNumberOfMoenysPlusOne{
//    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0],@"Number of cells us the number of moneys plus 1 (the total)");
//}

// N sections + 1 of Total on €
-(void)testNumberOfSectionsPlusTotalOnEuros{
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, [self.wallet count] + 1, @"Number of sections must be the same as the number of currency plus one");
}




























@end
























