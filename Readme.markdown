# DKSupport

`DKSupport` is a collection of utility classes and Objective-C
categories that make working UIKit easier.

It is used in the apps written by [Mostly Disco](http://www.mostlydisco.com)
and [The Frontier Group](http://www.thefrontiergroup.com.au)

## Installation

**Note: These installation instructions are for XCode 4**

1. Checkout the code into your project

        $ mkdir -p External/DKSupport
        $ curl -L http://github.com/keithpitt/DKSupport/tarball/master | tar xz --strip 1 -C External/DKSupport

    Or if you prefer to add it as a git submodule

        $ git submodule add git://github.com/keithpitt/DKSupport.git External/DKSupport

2. Open your XCode project, and create an `External` group

3. Create a group called `DKSupport`

4. In Finder, navigate to the DKSupport folder in your project, and drag
   all the files in `DKSupport/Classes` to the `DKSupport` group. When
   asked if you would like to copy the files, say no.

5. Repeat this process with all the folders in `DKSupport/External`

6. Add the following frameworks to your project (if they are not there
   already)

        libicucore.dylib
        SystemConfiguration.framework
        CFNetwork.framework
        Foundation.framework
        UIKit.framework

7. Add `-all_load -ObjC` to the `Other Linker Flags` build setting

8. Add `#import "DKSupport.h"` in your `Prefix.pch` file

## Usage

### DKPredicateBuilder

#### Introduction

The predicate builder is an easy way to generate `NSPredicate` objects for use
with your Core Data and NSArray queries.

    #import "DKPredicateBuilder.h"

    DKPredicateBuilder * predicateBuilder = [[DKPredicateBuilder alloc] init];

    [predicateBuilder where:@"name" equals:@"keith"];
    [predicateBuilder where:@"count" greaterThan:[NSNumber numberWithInt:12]];
    [predicateBuilder where:@"username" isNull:NO];

    NSLog(@"%@", [compoundPredicate predicateFormat]);
    // "name == \"keith\" AND count > 12 AND username != nil"

    [predicateBuilder release];

You can also chain together predicates like this

    [[predicateBuilder where:@"name" equals:@"keith"] where:@"username" isNull:NO]

#### API

`- (id)where:(DKPredicate *)predicate;`

Add a custom NSPredicate to the builder

`- (id)where:(NSString *)key isTrue:(BOOL)value;`

A predicate to check whether or not the key is `TRUE` or `FALSE`

    // All records where 'active' is TRUE
    [predicateBuilder where:@"active" isTrue:YES]

    // All records where 'active' is FALSE
    [predicateBuilder where:@"active" isTrue:NO]

`- (id)where:(NSString *)key isFalse:(BOOL)value;`

The compliment of `isTrue`

    // All records where 'active' is FALSE
    [predicateBuilder where:@"active" isFalse:YES]

    // All records where 'active' is TRUE
    [predicateBuilder where:@"active" isFalse:NO]

`- (id)where:(NSString *)key isNull:(BOOL)value;`

The key has a `NULL` value

    [predicateBuilder where:@"username" isNull:YES];

`- (id)where:(NSString *)key isNotNull:(BOOL)value;`

The key doesn't have a `NULL` value

    [predicateBuilder where:@"username" isNotNull:YES];

`- (id)where:(NSString *)key equals:(id)value;`

The key equals the value

    [predicateBuilder where:@"username" equals:@"keithpitt"];

`- (id)where:(NSString *)key doesntEqual:(id)value;`

The key doesn't equal the value

    [predicateBuilder where:@"username" doesntEqual:@"jordanmaguire"];

`- (id)where:(NSString *)key isIn:(NSArray *)values;`

The key is in one of the values

    [predicateBuilder where:@"username" equals:[NSArray arrayWithObjects:@"keithpitt", @"jordanmaguire", nil]];

`- (id)where:(NSString *)key isNotIn:(NSArray *)values;`

They key is not in one of the values

    [predicateBuilder where:@"username" equals:[NSArray arrayWithObjects:@"stevejobs", @"waz", nil]];

`- (id)where:(NSString *)key startsWith:(NSString *)value;`

The key starts with the value

    [predicateBuilder where:@"username" startsWith:@"kei"];

`- (id)where:(NSString *)key doesntStartWith:(NSString *)value;`

The key doesn't start with the value

    [predicateBuilder where:@"username" startsWith:@"jor"];

`- (id)where:(NSString *)key endsWith:(NSString *)value;`

The key ends with the value

    [predicateBuilder where:@"username" endsWith:@"pitt"];

`- (id)where:(NSString *)key doesntEndWith:(NSString *)value;`

The key doens't end with the value

    [predicateBuilder where:@"username" endsWith:@"maguire"];

`- (id)where:(NSString *)key contains:(NSString *)value;`

The key `CONTAINS` the value

    [predicateBuilder where:@"username" endsWith:@"eith"];

`- (id)where:(NSString *)key like:(NSString *)value;`

The key is `LIKE` the value

    [predicateBuilder where:@"username" like:@"keith"];

`- (id)where:(NSString *)key greaterThan:(id)value;`

The key is more than the value

    [predicateBuilder where:@"views" greaterThan:[NSNumber numberWithInt:12]];

`- (id)where:(NSString *)key greaterThanOrEqualTo:(id)value;`

The key is more than or equal to the value

    [predicateBuilder where:@"views" greaterThanOrEqualTo:[NSNumber numberWithInt:12]];

`- (id)where:(NSString *)key lessThan:(id)value;`

The key is less than the value

    [predicateBuilder where:@"views" lessThan:[NSNumber numberWithInt:12]];

`- (id)where:(NSString *)key lessThanOrEqualTo:(id)value;`

The key is less than or equal to the value

    [predicateBuilder where:@"views" lessThanOrEqualTo:[NSNumber numberWithInt:12]];

`- (id)where:(NSString *)key between:(id)first andThis:(id)second;`

The key is between the first value and the second value

    [predicateBuilder where:@"createdAt" between:[[NSDate date] beginingOfDay] andThis:[[NSDate date] endOfDay]];

`- (id)orderBy:(NSString *)column ascending:(BOOL)ascending;`

Creates an NSSortDescriptor and add it to the `sorters` property on the
`DKPropertyBuilder`

    [predicateBuilder orderBy:@"views" ascending:YES];

`- (id)limit:(int)value;`

Specify a limit of the query

    [predicateBuilder limit:12];

`- (id)offset:(int)value;`

Specify an offset for the query

    [predicateBuilder offset:63];

`- (NSCompoundPredicate *)compoundPredicate;`

Returns an `NSCompoundPredicate` with all the predicates defined

`- (NSString *)compoundPredicateKey;`

Returns an MD5 hash of the NSCompoundPredicate. This is usefull for cache keys.

### NSArray

#### Enumurables

`DKSupport` some basic enumeration functions similar to those found in
Ruby (http://www.ruby-doc.org/core/classes/Enumerable.html)

`- (NSArray *)collectWithBlock:(NSArrayCallbackBlock)block;`

Create an instance of `NSArray` of all the objects returned by the block.
This is similar to the `map` method in Ruby.

    NSArray * array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObject:@"Keith" forKey:@"name"],
                       [NSDictionary dictionaryWithObject:@"Jordan" forKey:@"name"],
                       nil];

    // Returns "Keith" and "Jordan"
    NSArray * collected = [array collectWithBlock:^(NSObject * object) {
        return [object valueForKey:@"name"];
    }];

`- (NSArray *)collectWithKey:(NSString *)key;`

Will call `objectForKey` on all the elements in the array with the key
provided.

    NSArray * array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObject:@"Keith" forKey:@"name"],
                       [NSDictionary dictionaryWithObject:@"Jordan" forKey:@"name"],
                       nil];

    // Returns "Keith" and "Jordan"
    NSArray * collected = [array collectWithKey:@"name"];

`- (NSObject *)findWithBlock:(NSArrayFindCallbackBlock)block;`

Returns the first result where the block returns `TRUE`

    NSArray * array = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                     [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"]
                     nil];

    NSDictionary * found = array findWithBlock:^(NSObject * object) {
        return [[object valueForKey:@"bar"] isEqualToString:@"not foo"];
    }];

`- (NSArray *)selectWithBlock:(NSArraySelectCallbackBlock)block;`

Returns all the elements in the array where the block returns `TRUE`

    NSArray * array = [NSArray arrayWithObjects:
                        [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                        [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                        [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"],
                        nil];

    NSArray * collected = [array selectWithBlock:^(NSObject * object) {
      return [[object valueForKey:@"bar"] isEqualToString:@"foo"];
    }];

### NSDate

#### Conversions

`- (NSString *)format:(NSString *)format;`

Provides a quick way of formatting an `NSDate`. For possible formats, see the
following http://unicode.org/reports/tr35/tr35-10.html#Date_Format_Patterns

    NSDate * date = [NSDate date]

    NSLog(@"%@", [date format:@"yyyy-MM-dd"]);

`- (NSDate *)utc;`

Returns the date converted to UTC

    // The current time in UTC
    NSDate * utcDate = [[NSDate date] utc];

`- (NSDate *)beginingOfDay;`

Return an `NSDate` with the time portion set to the beginning of the day

    // Returns the begining of today
    NSDate * beginingOfDay = [[NSDate date] beginingOfDay];

`- (NSDate *)endOfDay;`

Return an `NSDate` with the time portion set to the beginning of the day

    // Returns the end of today
    NSDate * endOfDay = [[NSDate date] endOfDay];

`- (BOOL)isSameDayAs:(NSDate*)date;`

Will return `TRUE` if the provided `NSDate` is on the same day

    // Will return TRUE
    [[NSDate date] isSameDayAs:[NSDate date]];

`- (BOOL)isToday;`

Will return `TRUE` if the date provided is on the same day as

    // Will return TRUE
    [[NSDate date] isToday];

#### Initializers

`+ (NSDate *)dateFromString:(NSString *)string;`

Create an instance of `NSDate` using the `ISO8601DateFormatter`

    NSDate * date = [NSDate dateFromString:@"05/12/2011 12:52:13 UTC"];

### NSMutableArray

#### Reverse

`- (void)reverse;`

Modifies the current `NSMutableArray` and reverse the order of the elements.

    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"a", @"b", @"c"];

    [array reverse]; // Array is now "c", "b", "a"

### NSNumber

#### Initializers

`+ (id)numberWithString:(NSString *)string`

Returns an autoreleased `NSNumber` from the string provided.

    NSNumber * number = [NSNumber numberWithString:@"124.6345"];

### NSObject

#### Blocks

`- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay`

Provides an easy way to execute a block after a period. Because this method is
on `NSObject` the object your executing this on must have extended from `NSObject`
(which is most objects in Cocoa).

    [self performBlock:^{
        NSLog(@"More energy...");
    } afterDelay:1000];

### NSString

#### Hash

`- (NSString *)md5`

Returns an MD5 hash of the string

    [@"Hey this is Arnold..." md5];

#### Inflections

The inflections in `DKSupport` came from a project called `Inflections`
written by Adam Elliot which can be found here: https://github.com/adamelliot/Inflections.
I took the project - fixed a few issues - moved the test suite into
Expecta and Cedar, and included it as part of `DKSupport`.

`- (NSString *)pluralize;`

Returns the plural form of the word in the string.

`- (NSString *)singularize;`

The reverse of +pluralize+, returns the singular form of a word in a string.

`- (NSString *)humanize;`

Capitalizes the first word and turns underscores into spaces and strips a trailing "_id", if any. Like +titleize+, this is meant for creating pretty output.

`- (NSString *)titleize;`

Capitalizes all words that are not part of the nonTitlecasedWords.

`- (NSString *)tableize;`

Create the name of a table like Rails does for models to table names. This method uses the +pluralize+ method on the last word in the string.

`- (NSString *)classify;`

Create a class name from a plural table name like Rails does for table names to models.

`- (NSString *)camelize;`

Converts an underscored separated string into a CamelCasedString.

`- (NSString *)camelizeWithLowerFirstLetter;`

Converts an underscored separated string into a camelCasedString with the first letter lower case.

`- (NSString *)underscore;`

Makes an underscored, lowercase form from the expression in the string.

`- (NSString *)dasherize;`

Replaces underscores with dashes in the string.

`- (NSString *)demodulize;`

Removes the module part from the expression in the string.

`- (NSString *)foreignKey;`

Creates a foreign key name from a class name.

`- (NSString *)foreignKeyWithoutIdUnderscore;`

Creates a foreign key name from a class name without the underscore  separating the id part.

`- (NSString *)ordinalize;`

Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.

`- (NSString *)capitalize;`

Capitalizes the first letter and makes everything else lower case.

#### Initializers

`+ (NSString *)stringWithRandom:(int)len`

Generates a string with random characters [a-z0-9] with the given length

    NSString * random = [NSString stringWithRandom:12];

### UIAlertView

`+ (UIAlertView *)alertWithError:(NSError*)error title:(NSString*)title;`

A quick way to show a `UIAlertView` from an `NSError`

    // Some operation that returns an NSError
    // ...

    [UIAlertView alertWithError:error title:@"Something Broke..."];

`+ (UIAlertView *)alertWithMessage:(NSString*)message title:(NSString*)title;`

A quick way of showing a `UIAlertView` with a message and a title

    [UIAlertView alertWithMessage:@"Something happened" title:@"Notice"];

`+ (UIAlertView *)alertWithMessage:(NSString*)message title:(NSString*)title cancelButtonTitle:(NSString *)cancelButtonTitle;`

    [UIAlertView alertWithMessage:@"Something happened: title:@"Notice" cancelButtonTitle:@"Go Away!"];

`DKSupport` also provides a convenient way to generate a UIAlertView and
handle responses via a block syntax

    [UIAlertView alertWithMessage:@"Are you sure?"
                            title:@"Save Document"
                cancelButtonTitle:@"No"
                otherButtonTitles:[NSArray arrayWithObjects:@"Yes", @"Yes and quit", nil]
                          dismiss:^(int buttonIndex) {
                              NSLog(@"User selected %i", buttonIndex);
                          } cancel:cancel^{
                              NSLog(@"User selected no");
                          }];

### UIViewController

`- (void)setParentController:(UIViewController *)parent;`

`UIViewController` classes in `UIKit` have a `parentViewController` property
used by `UINavigationController`. As of iOS 4.0, this property is read
only. This method allows you to manually set the `parentViewController`
property of a `UIViewController`.

    [controller setParentController:someOtherViewController];

## Running Specs

To run the specs, open [DKSupport.xcodeproj](https://github.com/keithpitt/DKSupport/tree/master/DKSupport.xcodeproj) project, and run the `Specs` target.

## Libraries Used

* http://code.google.com/p/json-framework
* https://github.com/petejkim/expecta
* https://github.com/pivotal/cedar
* http://boredzo.org/iso8601unparser/
* http://regexkit.sourceforge.net/#RegexKitLite
* https://github.com/fpillet/NSLogger
* https://github.com/adamelliot/Inflections

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

## Contributers

* [Keith Pitt](http://www.keithpitt.com)
* [Jordan Maguire](https://github.com/jordanmaguire)
* [The Frontier Group](http://www.thefrontiergroup.com.au)
* [Mostly Disco](http://www.mostlydisco.com)

## License

DKSupport is licensed under the MIT License:

  Copyright (c) 2011 Keith Pitt (http://www.keithpitt.com/)

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
