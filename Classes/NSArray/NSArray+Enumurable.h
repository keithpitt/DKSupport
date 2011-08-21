//
//  NSArray+Enumurable.h
//  DiscoKit
//
//  Created by Keith Pitt on 6/07/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^NSArrayCallbackBlock)(NSObject *);
typedef BOOL (^NSArrayFindCallbackBlock)(NSObject *);
typedef BOOL (^NSArraySelectCallbackBlock)(NSObject *);

@interface NSArray (Enumurable)

- (NSArray *)collectWithKey:(NSString *)key;

- (NSArray *)collectWithBlock:(NSArrayCallbackBlock)block;

- (NSObject *)findWithBlock:(NSArrayFindCallbackBlock)block;

- (NSArray *)selectWithBlock:(NSArraySelectCallbackBlock)block;

@end