//
//  AGTMoney.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTBroker.h"
#import "NSObject+GNUStepAddons.h"
@interface AGTMoney()
@property (nonatomic, strong) NSNumber *amount;
@end

@implementation AGTMoney

+(id) euroWithAmount:(NSInteger)amount{
    return [[AGTMoney alloc]initWithAmount:amount currency:@"EUR"];
}
+(id) dollarWithAmount:(NSInteger)amount{
    return [[AGTMoney alloc]initWithAmount:amount currency:@"USD"];
}



-(id)initWithAmount:(NSInteger )amount currency:(NSString *)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

//-(AGTMoney *)times:(NSInteger)multiplier{
//    // no se debería llamar, sino que se debería
//    // de usar el de la subclase
//    return [self subclassResponsibility:_cmd];
//}

-(id<AGTMoney>)times:(NSInteger)multiplier{
    AGTMoney * new = [[AGTMoney alloc]
                      initWithAmount:[self.amount integerValue] * multiplier currency:self.currency ];
    return new;
}
-(id<AGTMoney>)plus:(AGTMoney *)other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    AGTMoney *new = [[AGTMoney alloc] initWithAmount:totalAmount currency:self.currency];
    return new;
}
-(id<AGTMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(AGTBroker *)broker{
    double rate;
    if (currency == self.currency) {
        rate = 1;
    }else{
        rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency toCurrency:currency]] doubleValue];
    }
    NSInteger newAmount = [self.amount doubleValue] / rate;
    
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount: newAmount currency:currency];
    
    return newMoney;
    
}

#pragma mark -OverWritten
-(NSString *)description{
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], [self currency],[self amount]];
}

- (BOOL)isEqual:(id)other
{
    if ([self.currency isEqual:[other currency]]){
        return [self amount] == [other amount];
    }else{
        return NO;
    }
    
}

- (NSUInteger)hash{
    return [[self amount]integerValue];
}


@end
