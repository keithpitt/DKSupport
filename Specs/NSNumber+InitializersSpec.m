//
//  NSNumber+InitializersSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "SpecHelper.h"

#import "NSNumber+Initializers.h"

SPEC_BEGIN(NSNumberInitializersSpec)

describe(@"NSNumber+Initializers", ^{
   
    context(@"#numberWithString", ^{
        
        it(@"should return an NSNumber object", ^{
            NSNumber *number = [NSNumber numberWithString:@"12"];
            
            expect([number class]).toBeSubclassOf([NSNumber class]);
        });
        
        it(@"should convert the string to an NSNumber", ^{
            NSNumber *number = [NSNumber numberWithString:@"12"];
            
            expect(number).toEqual([NSNumber numberWithInt:12]);
        });
        
        it(@"should return 0 with non numbers", ^{            
            NSNumber *nonNumber = [NSNumber numberWithString:@"hello"];
            
            expect(nonNumber).toEqual([NSNumber numberWithInt:0]);
        });
        
        it(@"should return 0 with nil", ^{
            NSNumber *nonNumber = [NSNumber numberWithString:nil];
            
            expect(nonNumber).toEqual([NSNumber numberWithInt:0]);
        });
        
        
    });
    
});

SPEC_END