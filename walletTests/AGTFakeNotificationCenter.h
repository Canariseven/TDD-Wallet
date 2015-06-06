//
//  AGTFakeNotificationCenter.h
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 6/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTFakeNotificationCenter : NSObject
@property (nonatomic, strong) NSMutableDictionary *observers;
-(void)addObserver:(id)observer
          selector:(SEL)aSelector
              name:(NSString *)aName
            object:(id)anObject;
@end
