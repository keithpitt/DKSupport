//
//  NSArray+EnumurableSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 6/07/11.
//  Copyright 2011 n/a. All rights reserved.
//

#import "SpecHelper.h"

#import "NSArray+Enumurable.h"

SPEC_BEGIN(NSArrayEnumurableSpec)

describe(@"NSArray+Collect", ^{
    
    context(@"-collectWithKey", ^{
        
        __block NSArray * array;
        
        beforeEach(^{            
            array = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                     [NSDictionary dictionaryWithObject:@"oof" forKey:@"bar"],
                     nil];
        });
        
        it(@"should collect the keys and return an array", ^{
            NSArray * collected = [array collectWithKey:@"bar"];
            
            expect([collected objectAtIndex:0]).toEqual(@"foo");
            expect([collected objectAtIndex:1]).toEqual(@"oof");
        });
        
        it(@"should collect the keys with a block and return an array", ^{
            NSArray * collected = [array collectWithBlock:^(NSObject * object){                
                return [object valueForKey:@"bar"];
            }];
            
            expect([collected objectAtIndex:0]).toEqual(@"foo");
            expect([collected objectAtIndex:1]).toEqual(@"oof");
        });
        
        it(@"should return no records if it can't find the key", ^{
            NSArray * collected = [array collectWithKey:@"bleh"];
            
            expect([collected count]).toEqual(0);
        });
        
    });
    
    context(@"-selectWithBlock", ^{
        
        __block NSArray * array;
        
        beforeEach(^{            
            array = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                     [NSDictionary dictionaryWithObject:@"oof" forKey:@"bar"],
                     nil];
        });
        
        context(@"0 entries match criteria", ^{
            
            it(@"returns nil", ^{
                NSObject * collected = [array findWithBlock:^(NSObject * object){                
                    return [[object valueForKey:@"bar"] isEqualToString:@"Genghis Tron"];
                }];
                
                expect(collected).toEqual(nil);
            });
        });
        
        context(@"1 or more entries match criteria", ^{
            
            beforeEach(^{            
                array = [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                         [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                         [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"],
                         [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"],
                         nil];
            });
            
            it(@"returns the first matching result", ^{
                NSObject * collected = [array findWithBlock:^(NSObject * object){                
                    return [[object valueForKey:@"bar"] isEqualToString:@"not foo"];
                }];
                
                expect([collected valueForKey:@"bar"]).toEqual(@"not foo");
            });
        });
    });

    context(@"-selectWithBlock", ^{
        
        __block NSArray * array;
        
        beforeEach(^{            
            array = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                     [NSDictionary dictionaryWithObject:@"oof" forKey:@"bar"],
                     nil];
        });
        
        context(@"0 entries match criteria", ^{
            
            it(@"returns an empty array", ^{
                NSArray * collected = [array selectWithBlock:^(NSObject * object){                
                    return [[object valueForKey:@"bar"] isEqualToString:@"Genghis Tron"];
                }];
                
                expect([collected count]).toEqual(0);
            });
        });
        
        context(@"1 or more entries match criteria", ^{
            
            beforeEach(^{            
                array = [NSArray arrayWithObjects:
                         [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                         [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                         [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"],
                         nil];
            });
            
            it(@"returns an array containing the matching results", ^{
                NSArray * collected = [array selectWithBlock:^(NSObject * object){                
                    return [[object valueForKey:@"bar"] isEqualToString:@"foo"];
                }];
                
                expect([collected count]).toEqual(2);
            });
        });
        
    });
    
});

SPEC_END