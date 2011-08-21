//
//  NSString+InflectionsSpec.m
//  DiscoKit
//
//  Created by Keith Pitt on 21/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "SpecHelper.h"

#import "NSString+Inflections.h"

SPEC_BEGIN(NSStringInflectionsSpec)

NSDictionary *singularToPlural = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"search"      , @"searches",
     @"switch"      , @"switches",
     @"fix"         , @"fixes",
     @"box"         , @"boxes",
     @"process"     , @"processes",
     @"address"     , @"addresses",
     @"case"        , @"cases",
     @"stack"       , @"stacks",
     @"wish"        , @"wishes",
     @"fish"        , @"fish",
     @"jeans"       , @"jeans",
     @"funky jeans" , @"funky jeans",
     @"category"    , @"categories",
     @"query"       , @"queries",
     @"ability"     , @"abilities",
     @"agency"      , @"agencies",
     @"movie"       , @"movies",
     @"archive"     , @"archives",
     @"index"       , @"indices",
     @"wife"        , @"wives",
     @"safe"        , @"saves",
     @"half"        , @"halves",
     @"move"        , @"moves",
     @"salesperson" , @"salespeople",
     @"person"      , @"people",
     @"spokesman"   , @"spokesmen",
     @"man"         , @"men",
     @"woman"       , @"women",
     @"basis"       , @"bases",
     @"diagnosis"   , @"diagnoses",
     @"diagnosis_a" , @"diagnosis_as",
     @"datum"       , @"data",
     @"medium"      , @"media",
     @"analysis"    , @"analyses",
     @"node_child"  , @"node_children",
     @"child"       , @"children",
     @"experience"  , @"experiences",
     @"day"         , @"days",
     @"comment"     , @"comments",
     @"foobar"      , @"foobars",
     @"newsletter"  , @"newsletters",        
     @"old_news"    , @"old_news",
     @"news"        , @"news",
     @"series"      , @"series",
     @"species"     , @"species",
     @"quiz"        , @"quizzes",
     @"perspective" , @"perspectives",
     @"ox"          , @"oxen",
     @"photo"       , @"photos",
     @"buffalo"     , @"buffaloes",
     @"tomato"      , @"tomatoes",
     @"dwarf"       , @"dwarves",
     @"elf"         , @"elves",
     @"information" , @"information",
     @"equipment"   , @"equipment",
     @"bus"         , @"buses",
     @"status"      , @"statuses",
     @"status_code" , @"status_codes",
     @"mouse"       , @"mice",
     @"louse"       , @"lice",
     @"house"       , @"houses",
     @"octopus"     , @"octopi",
     @"virus"       , @"viri",
     @"alias"       , @"aliases",
     @"portfolio"   , @"portfolios",
     @"vertex"      , @"vertices",
     @"matrix"      , @"matrices",
     @"matrix_fu"   , @"matrix_fus",
     @"axis"        , @"axes",
     @"testis"      , @"testes",
     @"crisis"      , @"crises",
     @"rice"        , @"rice",
     @"shoe"        , @"shoes",
     @"horse"       , @"horses",
     @"prize"       , @"prizes",
     @"edge"        , @"edges",
     @"database"    , @"databases",
     nil];

NSDictionary *mixtureToTitleCase = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"active_record"       , @"Active Record",
     @"ActiveRecord"        , @"Active Record",
     @"action web service"  , @"Action Web Service",
     @"Action Web Service"  , @"Action Web Service",
     @"Action web service"  , @"Action Web Service",
     @"actionwebservice"    , @"Actionwebservice",
     @"Actionwebservice"    , @"Actionwebservice",
     @"david's code"        , @"David's Code",
     @"David's code"        , @"David's Code",
     @"david's Code"        , @"David's Code",
     nil];

NSDictionary *camelToUnderscore = 
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"Product"               , @"product",
     @"SpecialGuest"          , @"special_guest",
     @"ApplicationController" , @"application_controller",
     @"Area51Controller"      , @"area51_controller",
     nil];

NSDictionary *underscoreToLowerCamel =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"product"                , @"product",
     @"special_guest"          , @"specialGuest",
     @"application_controller" , @"applicationController",
     @"area51_controller"      , @"area51Controller",
     nil];

NSDictionary *camelToUnderscoreWithoutReverse =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"HTMLTidy"              , @"html_tidy",
     @"HTMLTidyGenerator"     , @"html_tidy_generator",
     @"FreeBSD"               , @"free_bsd",
     @"HTML"                  , @"html",
     nil];

NSDictionary *camelWithModuleToUnderscoreWithSlash =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"Admin::Product" , @"admin/product",
     @"Users::Commission::Department" , @"users/commission/department",
     @"UsersSection::CommissionDepartment" , @"users_section/commission_department",
     nil];

NSDictionary *classNameToForeignKeyWithUnderscore =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"Person" , @"person_id",
     @"MyApplication::Billing::Account" , @"account_id",
     nil];

NSDictionary *classNameToForeignKeyWithoutUnderscore =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"Person" , @"personid",
     @"MyApplication::Billing::Account" , @"accountid",
     nil];

NSDictionary *classNameToTableName =
    [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"PrimarySpokesman" , @"primary_spokesmen",
                                      @"NodeChild"        , @"node_children",
                                      nil];

NSDictionary *underscoreToHuman =
    [NSDictionary dictionaryWithObjectsAndKeys:
    @"employee_salary" , @"Employee salary",
    @"employee_id"     , @"Employee",
    @"underground"     , @"Underground",
    nil];

NSDictionary *ordinalNumbers =
    [NSDictionary dictionaryWithObjectsAndKeys:
    @"0" , @"0th",
    @"1" , @"1st",
    @"2" , @"2nd",
    @"3" , @"3rd",
    @"4" , @"4th",
    @"5" , @"5th",
    @"6" , @"6th",
    @"7" , @"7th",
    @"8" , @"8th",
    @"9" , @"9th",
    @"10" , @"10th",
    @"11" , @"11th",
    @"12" , @"12th",
    @"13" , @"13th",
    @"14" , @"14th",
    @"20" , @"20th",
    @"21" , @"21st",
    @"22" , @"22nd",
    @"23" , @"23rd",
    @"24" , @"24th",
    @"100" , @"100th",
    @"101" , @"101st",
    @"102" , @"102nd",
    @"103" , @"103rd",
    @"104" , @"104th",
    @"110" , @"110th",
    @"111" , @"111th",
    @"112" , @"112th",
    @"113" , @"113th",
    @"1000" , @"1000th",
    @"1001" , @"1001st",
    nil];

NSDictionary *underscoresToDashes =
    [NSDictionary dictionaryWithObjectsAndKeys:
    @"street"                , @"street",
    @"street_address"        , @"street-address",
    @"person_street_address" , @"person-street-address",
    nil];

describe(@"NSString+Inflections", ^{
    
    context(@"#pluralize", ^{
       
        it(@"should pluralize 'plurals'", ^{
            expect([@"plurals" pluralize]).toEqual(@"plurals");
            expect([@"Plurals" pluralize]).toEqual(@"Plurals");
        });
        
        it(@"should return an empty string if pluralizing one", ^{
            expect([@"" pluralize]).toEqual(@"");
        });
        
        // Dynamically create pluralization tests, because we can and it makes
        // for better error messages.
        for (NSString *plural in singularToPlural) {
            NSString *singular = [singularToPlural valueForKey:plural];
        
            it([NSString stringWithFormat:@"should correctly pluralize '%@' to '%@'", singular, plural], ^{
                expect([singular pluralize]).toEqual(plural);
                expect([[singular pluralize] capitalize]).toEqual([plural capitalize]);
            });
        };
        
    });
    
    context(@"#singularize", ^{
        
        for (NSString *plural in singularToPlural) {
            NSString *singular = [singularToPlural valueForKey:plural];
            
            it([NSString stringWithFormat:@"should correctly singularize '%@' to '%@'", plural, singular], ^{
                expect([plural singularize]).toEqual(singular);
                expect([[plural capitalize] singularize]).toEqual([singular capitalize]);
            });
        };
        
    });
    
    context(@"#titleize", ^{
        
        for (NSString *titleized in mixtureToTitleCase) {
            NSString *normal = [mixtureToTitleCase valueForKey:titleized];
            
            it([NSString stringWithFormat:@"should correctly titleize '%@' to '%@'", normal, titleized], ^{
                NSString *result = [normal titleize];
                expect(result).toEqual(titleized);
            });
        };
        
    });
    
    context(@"#camelize", ^{
        
        for (NSString *test in camelToUnderscore) {
            NSString *result = [camelToUnderscore valueForKey:test];
            
            it([NSString stringWithFormat:@"should correctly camelize '%@' to '%@'", test, result], ^{
                expect([test camelize]).toEqual(result);
            });
        };
        
        for (NSString *test in camelWithModuleToUnderscoreWithSlash) {
            NSString *result = [camelWithModuleToUnderscoreWithSlash valueForKey:test];
            
            it([NSString stringWithFormat:@"should correctly camelize '%@' to '%@'", test, result], ^{
                expect([test camelize]).toEqual(result);
            });
        };
        
    });
    
    context(@"#camelizeWithLowerFirstLetter", ^{
        
        it(@"should lowercase the first letter", ^{
            expect([@"Capital" camelizeWithLowerFirstLetter]).toEqual(@"capital");
        });
        
        for (NSString *lowerCamel in underscoreToLowerCamel) {
            NSString *underscored = [underscoreToLowerCamel valueForKey:lowerCamel];
            
            it([NSString stringWithFormat:@"should correctly camelize with lower first letter '%@' to '%@'", underscored, lowerCamel], ^{
                expect([underscored camelizeWithLowerFirstLetter]).toEqual(lowerCamel);
            });
        };
            
    });
    
    context(@"#underscore", ^{
        
        for (NSString *underscore in camelToUnderscore) {
            NSString *camel = [camelToUnderscore valueForKey:underscore];
            
            it([NSString stringWithFormat:@"should correctly underscore '%@' to '%@'", camel, underscore], ^{
                expect([camel underscore]).toEqual(underscore);
            });
        }
        
        for (NSString *underscore in camelToUnderscoreWithoutReverse) {
            NSString *camel = [camelToUnderscoreWithoutReverse valueForKey:underscore];
            
            it([NSString stringWithFormat:@"should correctly underscore '%@' to '%@'", camel, underscore], ^{
                expect([camel underscore]).toEqual(underscore);
            });
        }
        
        for (NSString *underscore in camelWithModuleToUnderscoreWithSlash) {
            NSString *camel = [camelWithModuleToUnderscoreWithSlash valueForKey:underscore];
            
            it([NSString stringWithFormat:@"should correctly underscore '%@' to '%@'", camel, underscore], ^{
                expect([camel underscore]).toEqual(underscore);
            });
        }
        
        for (NSString *dasherized in underscoresToDashes) {
            NSString *underscored = [underscoresToDashes valueForKey:dasherized];
            NSString *test = [[underscored dasherize] underscore];
            
            it([NSString stringWithFormat:@"should correctly underscore '%@' to '%@'", test, underscored], ^{
                expect(test).toEqual(underscored);
            });
        }
        
    });
    
    context(@"#demodulize", ^{
        
        it(@"should correctly demodulize 'MyApplication::Billing::Account' to 'Account'", ^{
            expect([@"MyApplication::Billing::Account" demodulize]).toEqual(@"Account");
        });
        
    });
    
    context(@"#foreignKey", ^{
        
        for (NSString *foreignKey in classNameToForeignKeyWithUnderscore) {
            NSString *klass = [classNameToForeignKeyWithUnderscore valueForKey:foreignKey];
            
            it([NSString stringWithFormat:@"should correctly foreignKey '%@' to '%@'", klass, foreignKey], ^{
                expect([klass foreignKey]).toEqual(foreignKey);
            });
        };
        
    });
    
    context(@"#foreignKeyWithoutIdUnderscore", ^{
        
        for (NSString *foreignKey in classNameToForeignKeyWithoutUnderscore) {
            NSString *klass = [classNameToForeignKeyWithoutUnderscore valueForKey:foreignKey];
            
            it([NSString stringWithFormat:@"should correctly foreignKeyWithoutIdUnderscore '%@' to '%@'", klass, foreignKey], ^{              
                expect([klass foreignKeyWithoutIdUnderscore]).toEqual(foreignKey);
            });
        };
        
    });
    
    context(@"#tableize", ^{
        
        for (NSString *tableName in classNameToTableName) {
            NSString *className = [classNameToTableName valueForKey:tableName];
            
            it([NSString stringWithFormat:@"should correctly tableize '%@' to '%@'", className, tableName], ^{              
                expect([className tableize]).toEqual(tableName);
            });
        };
        
    });
    
    context(@"#classify", ^{
        
        for (NSString *tableName in classNameToTableName) {
            NSString *className = [classNameToTableName valueForKey:tableName];
            NSString *tableNamePrefixed = [@"table_prefix." stringByAppendingString:tableName];
            
            it([NSString stringWithFormat:@"should correctly classify '%@' to '%@'", tableName, className], ^{
                expect([tableName classify]).toEqual(className);
            });
            
            it([NSString stringWithFormat:@"should correctly classify '%@' to '%@'", tableNamePrefixed, className], ^{
                expect([tableNamePrefixed classify]).toEqual(className);
            });
        }
        
        it(@"should correctly classify filenames like 'schema.foo_bar' to 'FooBar'", ^{
            expect([@"schema.foo_bar" classify]).toEqual(@"FooBar");
        });
        
    });
    
    context(@"#humanize", ^{
        
        for (NSString *human in underscoreToHuman) {
            NSString *undescore = [underscoreToHuman valueForKey:human];
            
            it([NSString stringWithFormat:@"should correctly humanize '%@' to '%@'", undescore, human], ^{
                expect([undescore humanize]).toEqual(human);
            });
        };
        
    });
    
    context(@"#ordinalize", ^{
        
        for (NSString *ordinalized in ordinalNumbers) {
            NSString *number = [ordinalNumbers valueForKey:ordinalized];
            
            it([NSString stringWithFormat:@"should correctly ordinalize '%@' to '%@'", number, ordinalized], ^{
                expect([number ordinalize]).toEqual(ordinalized);
            });
        };
        
    });
    
    context(@"#dasherize", ^{
        
        for (NSString *dasherized in underscoresToDashes) {
            NSString *underscored = [underscoresToDashes valueForKey:dasherized];
            
            it([NSString stringWithFormat:@"should correctly dasherize '%@' to '%@'", underscored, dasherized], ^{
                expect([underscored dasherize]).toEqual(dasherized);
            });
        };
        
    });
    
    context(@"#capitalize", ^{
        
        it(@"should correctly capitalize the first letter of a word", ^{
            expect([@"foobar" capitalize]).toEqual(@"Foobar");
        });
        
    });

});

SPEC_END