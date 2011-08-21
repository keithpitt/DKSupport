//
//  NSString+HashSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "SpecHelper.h"

#import "NSString+Hash.h"

SPEC_BEGIN(NSStringHashSpec)

describe(@"NSString+Hash", ^{
    
    context(@"-md5", ^{
        
        it(@"return an MD5 hash", ^{
            NSString * md5 = [@"Something hashy" md5];
            
            expect(md5).toEqual(@"34038D1E3350650A148C0DFB0AC7A72D");
        });
                
    });
    
});

SPEC_END