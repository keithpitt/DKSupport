//
//  NSNumber+Initializers.m
//  DiscoKit
//
//  Created by Keith Pitt on 17/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSNumber+Initializers.h"

@implementation NSNumber (Initializers)

+ (id)numberWithString:(NSString *)string {
    
    return [NSNumber numberWithInt:[string intValue]];
    
}

@end
