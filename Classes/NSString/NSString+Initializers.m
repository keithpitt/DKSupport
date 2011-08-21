//
//  NSString+Initializers.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSString+Initializers.h"

@implementation NSString (Initializers)

+ (NSString*)stringWithRandom:(int)len {
    
    if (len == 0)
        return @"";
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i < len; i++)
        [randomString appendFormat: @"%c", [letters characterAtIndex: rand()%[letters length]]];
    
    return randomString;
    
}

@end
