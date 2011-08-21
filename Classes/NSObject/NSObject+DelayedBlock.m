//
//  NSObject+DelayedBlock.m
//  DiscoKit
//
//  Created by Keith Pitt on 12/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSObject+DelayedBlock.h"

@implementation NSObject (DelayedBlock)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    
    int64_t delta = (int64_t)(1.0e9 * delay);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
    
}

@end