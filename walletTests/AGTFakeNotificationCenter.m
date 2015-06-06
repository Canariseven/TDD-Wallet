//
//  AGTFakeNotificationCenter.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 6/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//

#import "AGTFakeNotificationCenter.h"

@implementation AGTFakeNotificationCenter
-(id)init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}
-(void)addObserver:(id)observer
          selector:(SEL)aSelector
              name:(NSString *)aName
            object:(id)anObject{
    [self.observers setObject:observer forKey:aName];
}
@end
