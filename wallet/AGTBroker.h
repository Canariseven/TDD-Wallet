//
//  AGTBroker.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"
@interface AGTBroker : NSObject
@property (nonatomic, strong, readonly) NSMutableDictionary *rates;
-(id<AGTMoney>)reduce:(id<AGTMoney>)money toCurrency:(NSString *)currency;
-(void)addRate:(double)rate
  fromCurrency:(NSString *)fromCurrency
    toCurrency:(NSString *)toCurrency;
-(NSString *) keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency;
@end
