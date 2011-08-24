# DKSupport

`DKSupport` is a collection of utility classes and Objective-C
categories that make working UIKit easier.

It is used in the apps written by [Mostly Disco](http://www.mostlydisco.com)
and [The Frontier Group](http://www.thefrontiergroup.com.au)

## Installation

**Note: These installation instructions are for XCode 4**

1. Checkout the code into your project

        mkdir -p External/DKSupport
        curl -L http://github.com/keithpitt/DKSupport/tarball/master | tar xz --strip 1 -C External/DKSupport

    Or if you prefer to add it as a git submodule

        git submodule add git://github.com/keithpitt/DKSupport.git External/DKSupport

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

8. Add `#import "DKSupport.h" in your `Prefix.pch` file

## Usage

For more documentation, visit http://keithpitt.github.com/DKSupport

### DKPredicateBuilder

The predicate builder is an easy way to generate `NSPredicate` objects for use
with your Core Data and NSArray queries. For the full `DKPredicateBuilder` API,
see http://keithpitt.github.com/DKSupport/Classes/DKPredicateBuilder.html

    #import "DKPredicateBuilder.h"

    DKPredicateBuilder * predicateBuilder = [[DKPredicateBuilder alloc] init];

    [predicateBuilder where:@"name" equals:@"keith"];
    [predicateBuilder where:@"count" greaterThan:[NSNumber numberWithInt:12]];
    [predicateBuilder where:@"username" isNull:NO];

    NSLog(@"%@", [compoundPredicate predicateFormat]);
    // "name == \"keith\" AND count > 12 AND username != nil"

    [predicateBuilder release];

### NSArray

#### Enumurables

`DKSupport` some basic enumeration functions similar to those found in
Ruby (http://www.ruby-doc.org/core/classes/Enumerable.html)

`- (NSArray *)collectWithBlock:(NSArrayCallbackBlock)block`
and `- (NSArray *)collectWithKey:(NSString *)key` will create an `NSArray` of all
the objects returned by the block. This is similar to the `map` method
in Ruby.

    NSArray * array = [NSArray arrayWithObjects:
                       [NSDictionary dictionaryWithObject:@"Keith" forKey:@"name"],
                       [NSDictionary dictionaryWithObject:@"Jordan" forKey:@"name"],
                       nil];

    // The following examples will both return an NSArray object with
    // "Keith" and "Jordan" as elements

    NSArray * collected1 = [array collectWithKey:@"name"];

    NSArray * collected2 = [array collectWithBlock:^(NSObject * object) {
        return [object valueForKey:@"name"];
    }];

`- (NSObject *)findWithBlock:(NSArrayFindCallbackBlock)block` will return the
first result where the block returns `TRUE`

    NSArray * array = [NSArray arrayWithObjects:
                     [NSDictionary dictionaryWithObject:@"foo" forKey:@"bar"],
                     [NSDictionary dictionaryWithObject:@"not foo" forKey:@"bar"]
                     nil];

    NSDictionary * found = array findWithBlock:^(NSObject * object) {
        return [[object valueForKey:@"bar"] isEqualToString:@"not foo"];
    }];

`- (NSArray *)selectWithBlock:(NSArraySelectCallbackBlock)block` will return all
the results that return `TRUE`

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

`- (NSString *)format:(NSString *)format` provides a quick way of formatting an
`NSDate`. For possible formats, see the following http://unicode.org/reports/tr35/tr35-10.html#Date_Format_Patterns
and http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html

    NSDate * date = [NSDate date]

    NSLog(@"%@", [date format:@"yyyy-MM-dd"]);

`- (NSDate *)utc` will return the date converted to UTC

    // The current time in UTC
    NSDate * utcDate = [[NSDate date] utc];

`- (NSDate *)beginingOfDay` will return an `NSDate` with the time portion set to the
beginning of the day

    // Returns the begining of today
    NSDate * beginingOfDay = [[NSDate date] beginingOfDay];

`- (NSDate *)endOfDay` will return an `NSDate` with the time portion set to the
beginning of the day

    // Returns the end of today
    NSDate * endOfDay = [[NSDate date] endOfDay];

`- (BOOL)isSameDayAs:(NSDate*)date;` will return `TRUE` if the provided `NSDate`
is on the same day

    // Will return TRUE
    [[NSDate date] isSameDayAs:[NSDate date]];

`- (BOOL)isToday` will return `TRUE` if the date is today

    // Will return TRUE
    [[NSDate date] isToday];

#### Initializers

`+ (NSDate *)dateFromString:(NSString *)string;` will create an instance of `NSDate` using the
`ISO8601DateFormatter`

    NSString * someDate = @"05/12/2011 12:52:13 UTC";

    NSDate * date = [NSDate dateFromString:someDate];

### NSMutableArray

### NSNumber

### NSObject

### NSString

### UIAlertView

### UIViewController

### DKLogger

## Running Specs

To run the specs, open [DKSupport.xcodeproj](https://github.com/keithpitt/DKSupport/tree/master/DKSupport.xcodeproj) project, and run the `Specs` target.

## Documentation

To build the documentation, just run `rake` in the root of the project. You will need [appledoc](http://www.gentlebytes.com/home/appledocapp/) installed, and an environment variable `APPLEDOC_TEMPLATE_PATH` set pointing to the path of your appledoc templates.

## Libraries Used

* http://code.google.com/p/json-framework
* https://github.com/petejkim/expecta
* https://github.com/pivotal/cedar
* http://boredzo.org/iso8601unparser/
* http://regexkit.sourceforge.net/#RegexKitLite
* https://github.com/fpillet/NSLogger

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
