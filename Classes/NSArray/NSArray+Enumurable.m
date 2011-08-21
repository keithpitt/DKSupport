//
//  NSArray+Enumurable.m
//  DiscoKit
//
//  Created by Keith Pitt on 6/07/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSArray+Enumurable.h"

@implementation NSArray (Enumurable)

- (NSArray *)collectWithKey:(NSString *)key {
    
    return [self collectWithBlock:^(NSObject * object) {
        return [object valueForKey:key];
    }];
    
}

- (NSArray *)collectWithBlock:(NSArrayCallbackBlock)block {
    
    NSMutableArray * collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (NSObject * object in self) {
        id result = block(object);
        if (result) {
            [collection addObject:result];
        }
    }
    
    return collection;
    
}

- (NSObject *)findWithBlock:(NSArrayFindCallbackBlock)block {
    
    for (NSObject * object in self) {
        if (block(object)) {
            return object;
        }
    }
    
    return nil;
    
}

- (NSArray *)selectWithBlock:(NSArraySelectCallbackBlock)block {
    
    NSMutableArray * collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (NSObject * object in self) {
        if (block(object)) {
            [collection addObject:object];
        }
    }
    
    return collection;
    
}

@end