//
//  AGTBroker.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"
@interface AGTBroker ()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end
@implementation AGTBroker
-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}
// Reducimos a una sola divisa
-(id<AGTMoney>)reduce:(id<AGTMoney>)money toCurrency:(NSString *)currency{
    // double dispatch
    return [money reduceToCurrency:currency withBroker:self];
}
-(void)addRate:(double)rate
  fromCurrency:(NSString *)fromCurrency
    toCurrency:(NSString *)toCurrency{
    [self.rates setObject:@(rate) forKey:[self keyFromCurrency:fromCurrency toCurrency:toCurrency]];
    [self.rates setObject:@(1.0/rate) forKey:[self keyFromCurrency:toCurrency toCurrency:fromCurrency]];
}

#pragma mark - Utils
-(NSString *) keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency{
    return [NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency];
}

@end
