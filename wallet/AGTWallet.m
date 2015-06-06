//
//  AGTWallet.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 5/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTWallet.h"

@interface AGTWallet()
@property (nonatomic, strong) NSMutableArray *currencies;
@end

@implementation AGTWallet
- (NSUInteger)count{
    NSInteger moneys = 0;
    for (NSArray *arr in self.currencies) {
        moneys += arr.count;
    }
    return moneys;
}
-(NSUInteger)numberOfCurrencies{
    return self.currencies.count;
}
-(id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency:currency];
        _currencies = [NSMutableArray array];
        [_currencies addObject:@[money].mutableCopy];
    }
    return self;
}
-(id<AGTMoney>)plus:(AGTMoney *)other{
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
    NSInteger index= 0;
    for (NSArray *currency in self.currencies) {
        NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:currency.count];
        for (AGTMoney *each in currency) {
            AGTMoney *newMoney = [each times:multiplier];
            [newMoneys addObject:newMoney];
        }
        [self.currencies[index] replaceObjectAtIndex:index withObject:newMoneys];
        index++;
    }
    
    return self;
}
-(id<AGTMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(AGTBroker *)broker{
    AGTMoney *result = [[AGTMoney alloc]initWithAmount:0 currency:currency];
    for (NSArray *arr in self.currencies) {
        for (AGTMoney *each in arr) {
            result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
        }
    }
    return result;
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
    for (NSArray *each in self.currencies) {
        str = [NSString stringWithFormat:@"%@ \n%@",str,each];
    }
    return str;
}
@end
