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
#import "AGTBroker.h"
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
    [self.wallet plus:[AGTMoney dollarWithAmount:20]];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    [self.wallet plus:[AGTMoney euroWithAmount:10]];
    [self.wallet plus:[AGTMoney euroWithAmount:50]];
    [self.wallet plus:[AGTMoney libraEsterlinaWithAmount:20]];
    [self.wallet plus:[AGTMoney libraEsterlinaWithAmount:5]];
    [self.wallet plus:[AGTMoney libraEsterlinaWithAmount:30]];
    self.walletVC = [[AGTWalletTableViewController alloc]initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    // Lo destruimos
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    self.wallet = nil;
    self.walletVC = nil;
    
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
// La cantidad de divisas nos la dice el broker, o también podemos modificar el método de adición del wallet.
// Por facilidad la pillamos del broker.
-(void)testNumberOfSectionsPlusTotalOnEuros{
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    XCTAssertEqual(sections, [self.wallet numberOfCurrencies] + 1, @"Number of sections must be the same as the number of currency plus one");
}

-(void)testNumberTotalOfCells{
    // Cuidado con la última sección
    NSInteger sections = [self.wallet numberOfCurrencies];
    NSInteger cells = 0;
    for (NSInteger section; section<= sections-1; section++) {
        cells += [self.walletVC tableView:nil numberOfRowsInSection:section];
        NSLog(@"%ld",(long)[self.walletVC tableView:nil numberOfRowsInSection:section]);
    }
    
    NSInteger totalCell = sections + [self.wallet count];
    XCTAssertEqual(totalCell, cells,@"Number of cells by section must be n + 1");
}
-(void)testLastSectionOneCell{
    NSInteger cellsLastSection = [self.walletVC tableView:nil numberOfRowsInSection:self.wallet.numberOfCurrencies + 1];
    XCTAssertEqual(1, cellsLastSection,@"Last Section of tableView has must only one cell");
}

























@end
























