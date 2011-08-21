//
//  NSObject+DelayedBlock.h
//  DiscoKit
//
//  Created by Keith Pitt on 12/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(Delayed)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end