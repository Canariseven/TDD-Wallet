//
//  AGTWallet.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AGTMoney.h"
@interface AGTWallet : NSObject<AGTMoney>
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSUInteger numberOfCurrencies;
-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc;
-(NSInteger)numberOfMoneysForCurrency:(NSString *)currency;
-(NSInteger)numberOfMoneysAtIndex:(NSInteger)index;
@end
