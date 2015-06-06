//
//  AGTMoney.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;
@protocol AGTMoney <NSObject>
-(id)initWithAmount:(NSInteger )amount currency:(NSString *)currency;
-(id<AGTMoney>)times:(NSInteger)multiplier;
-(id<AGTMoney>)plus:(AGTMoney *)other;
-(id<AGTMoney>)reduceToCurrency:(NSString *)currency
                     withBroker:(AGTBroker *)broker;


@end


@interface AGTMoney : NSObject <AGTMoney>
@property (nonatomic,strong, readonly) NSString * currency;
@property (nonatomic, readonly) NSNumber * amount;
+(id) euroWithAmount:(NSInteger)amount;
+(id) dollarWithAmount:(NSInteger)amount;
+(id) libraEsterlinaWithAmount:(NSInteger)amount;
+(id) yenWithAmount:(NSInteger)amount;

@end
