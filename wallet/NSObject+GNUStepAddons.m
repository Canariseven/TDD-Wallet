//
//  NSObject+GNUStepAddons.m
//  wallet
//
//  Created by Carmelo Ruymán Quintana Santana on 4/6/15.
//  Copyright (c) 2015 Carmelo Ruymán Quintana Santana. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)
-(id) subclassResponsibility:(SEL)aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    [NSException raise:NSInvalidArgumentException
     format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    return self; // not reached
}
@end
