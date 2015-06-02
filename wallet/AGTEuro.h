//
//  AGTEuro.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 2/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTEuro : NSObject
-(id)initWithAmount:(NSInteger )amount;
-(AGTEuro *)times:(NSInteger)multiplier;
@end
