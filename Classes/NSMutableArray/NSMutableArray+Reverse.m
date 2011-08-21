//
//  NSMutableArray+Reverse.m
//  DiscoKit
//
//  Created by Keith Pitt on 25/05/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSMutableArray+Reverse.h"

@implementation NSMutableArray (Reverse)

- (void)reverse {
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];
        i++;
        j--;
    }
}

@end