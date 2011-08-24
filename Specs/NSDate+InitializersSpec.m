//
//  NSDate+InitializersSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "SpecHelper.h"

#import "NSDate+Initializers.h"
#import "NSDate+Conversions.h"

SPEC_BEGIN(NSDateInitializersSpec)

context(@"#dateFromString", ^{
    
    it(@"should return a date", ^{
        id date = [NSDate dateFromString:@"2011-06-21 05:47:44 +0000"];
        
        expect(date).toBeKindOf([NSDate class]);
    });
   
    it(@"should create a date from a string", ^{    
        NSDate *date = [NSDate dateFromString:@"2011-06-21 05:47:44 +0000"];
        NSString *formatted = [date format:DKSupportFullDateFormat];
            
        expect(formatted).toEqual(@"2011-06-21 05:47:44");
    });
    
    it(@"should return nil if you parse from nil", ^{
        NSDate *date = [NSDate dateFromString:nil];
        
        expect(date).toBeNil();
    });
    
});

SPEC_END