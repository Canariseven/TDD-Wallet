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
-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc;
@end
