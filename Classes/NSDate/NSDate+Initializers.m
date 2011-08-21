//
//  NSDate+Initializers.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSDate+Initializers.h"
#import "ISO8601DateFormatter.h"

@implementation NSDate (Initializers)

+ (NSDate*)dateFromString:(NSString*)string {
    
    // Bail out if we have no string
    if (string == nil) {
        return nil;
    }
    
    // Parse using the ISO8601DateFormatter formatter
    ISO8601DateFormatter *formatter = [[ISO8601DateFormatter new] autorelease];
    return [formatter dateFromString:string];
    
}

@end
