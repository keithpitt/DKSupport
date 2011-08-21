//
//  NSDate+Conversions.m
//  DiscoKit
//
//  Created by Keith Pitt on 17/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "NSDate+Conversions.h"
#import "NSDate+Initializers.h"

@implementation NSDate (Conversions)

- (NSString*)format:(NSString*)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter new] autorelease];
	[dateFormatter setDateFormat:format];
	
    return [dateFormatter stringFromDate:self];
    
}

- (NSDate*)utc {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter new] autorelease];
	[dateFormatter setDateFormat:DKSupportFullDateFormat];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
	
    return [NSDate dateFromString:[dateFormatter stringFromDate:self]];
    
}

- (NSDate*)beginingOfDay {
    
    return [NSDate dateFromString:[self format:@"yyyy-MM-dd 00:00:00"]];
    
}

- (NSDate*)endOfDay {
    
    return [NSDate dateFromString:[self format:@"yyyy-MM-dd 23:59:59"]];
    
}

- (bool)isEqualToDate:(NSDate*)date {
    
    NSString *firstDate = [self format:DKSupportShortDateFormat];
    NSString *secondDate = [date format:DKSupportShortDateFormat];
    
    return [firstDate isEqualToString:secondDate];
    
}

- (bool)isToday {
    
    return [self isEqualToDate:[NSDate date]];
    
}

@end
