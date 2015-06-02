//
//  AGTDollar.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTDollar : NSObject
-(id)initWithAmount:(NSInteger )amount;
-(AGTDollar *)times:(NSInteger)multiplier;
@end
