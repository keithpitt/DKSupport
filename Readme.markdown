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

## Usage

For more documentation, visit http://keithpitt.github.com/DKSupport

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

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Send me a pull request. Bonus points for topic branches.

## Contributers

* [Keith Pitt](http://www.keithpitt.com)
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
