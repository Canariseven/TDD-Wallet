//
//  AGTDollar.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTDollar.h"

@interface AGTDollar ()
// Fuera solo lectura, dentro permite lectura/escritura
@property (nonatomic) NSInteger amount;
@end

@implementation AGTDollar
-(id)initWithAmount:(NSInteger)amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(AGTDollar *)times:(NSInteger)multiplier{
    AGTDollar * new = [[AGTDollar alloc]
                     initWithAmount:self.amount * multiplier ];
    return new;
}

#pragma mark - Overwritten
- (BOOL)isEqual:(id)other
{
    return [self amount] == [other amount];
}

- (NSUInteger)hash
{
    return self.amount;
}
@end
