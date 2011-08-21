//
//  NSString+Hash.h
//  DiscoKit
//
//  Created by Keith Pitt on 12/08/11.
//  Copyright 2011 n/a. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

@interface NSString (Hash)

- (NSString *)md5;

@end