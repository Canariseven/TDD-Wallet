//
//  AGTWallet.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTWallet.h"

@interface AGTWallet()
@property (nonatomic, strong) NSMutableArray *moneys;
@property (nonatomic, strong) NSMutableArray *currencies;
@end

@implementation AGTWallet
- (NSUInteger)count{
    return self.moneys.count;
}
-(NSUInteger)numberOfCurrencies{
    return self.currencies.count;
}
-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
        _currencies = [NSMutableArray array];
        [_currencies addObject:@[money].mutableCopy];
    }
    return self;
}
-(id<AGTMoney>)plus:(AGTMoney *)other{
    [self.moneys addObject:other];
    [self fillCurrencies:other];
    return self;
}
-(void)fillCurrencies:(AGTMoney *)other{
    NSInteger index = 0;
    for (NSMutableArray *arr in self.currencies) {
        AGTMoney *each = arr[0];
        if ([each.currency isEqualToString:other.currency]) {
            [arr addObject:other];
            [self.currencies replaceObjectAtIndex:index withObject:arr];
            return;
        }
        index++;
    }
    [self.currencies addObject:@[other].mutableCopy];
}
-(id<AGTMoney>)times:(NSInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (AGTMoney *each in self.moneys) {
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}
-(id<AGTMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(AGTBroker *)broker{
    AGTMoney *result = [[AGTMoney alloc]initWithAmount:0 currency:currency];
    for (AGTMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    return result;
}
-(NSInteger)numberOfMoneysForCurrency:(NSString *)currency{
    NSInteger total = 0;
    for (AGTMoney *each in self.moneys) {
        if ([each.currency isEqualToString:currency]) {
            total++;
        }
    }
    return total;
}
-(NSInteger)numberOfMoneysAtIndex:(NSInteger)index{
    NSArray *array = self.currencies[index];
    return [array count];
}

#pragma mark - Notifications
-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc{
    [nc addObserver:self selector:@selector(dumpToDisk:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
}
-(void)dumpToDisk:(NSNotification *)nc{
    NSLog(@"Guardar las cosas en disco cuando la cosa se ponga fea");
}

#pragma mark - Overwrite
-(NSString *)description{
NSString *str = @"";
    for (AGTMoney *each in self.moneys) {
        str = [NSString stringWithFormat:@"%@ \n%@",str,each];
    }
    return str;
}
@end
