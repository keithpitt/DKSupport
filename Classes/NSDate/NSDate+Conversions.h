//
//  NSDate+Conversions.h
//  DiscoKit
//
//  Created by Keith Pitt on 17/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DKSupportFullDateFormat @"yyyy-MM-dd HH:mm:ss"
#define DKSupportShortDateFormat @"yyyy-MM-dd"

@interface NSDate (Conversions)

- (NSString*)format:(NSString*)format;
- (NSDate*)utc;
- (NSDate*)beginingOfDay;
- (NSDate*)endOfDay;

- (bool)isEqualToDate:(NSDate*)date;
- (bool)isToday;

@end