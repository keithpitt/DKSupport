//
//  NSString+InitializersSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "SpecHelper.h"

#import "NSString+Initializers.h"

SPEC_BEGIN(NSStringInitializersSpec)

context(@"NSString#stringWithRandom", ^{
    
    it(@"should return a string", ^{
        NSString *result = [NSString stringWithRandom:10];
        
        expect(result).toBeKindOf([NSString class]);
    });

    it(@"should generate a random string", ^{
        NSString *string1 = [NSString stringWithRandom:10];
        NSString *string2 = [NSString stringWithRandom:10];
        
        expect(string1).Not.toEqual(string2);
    });
    
    it(@"should return an empty string if passed 0 as a length", ^{
        NSString *result = [NSString stringWithRandom:0];
        
        expect(result).toEqual(@"");
    });
    
});

SPEC_END