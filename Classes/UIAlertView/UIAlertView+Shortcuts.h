//
//  UIAlertView+Shortcuts.h
//  DiscoKit
//
//  Created by Keith Pitt on 12/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^UIAlertViewDismissBlock)(int buttonIndex);
typedef void (^UIAlertViewCancelBlock)();

@interface UIAlertView (Shortcuts)

+ (UIAlertView *)alertWithError:(NSError*)error
                          title:(NSString*)title;

+ (UIAlertView *)alertWithMessage:(NSString*)message
                            title:(NSString*)title;

+ (UIAlertView *)alertWithMessage:(NSString*)message
                            title:(NSString*)title
                cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (UIAlertView *)alertWithMessage:(NSString*)message
                            title:(NSString*)title
                cancelButtonTitle:(NSString *)cancelButtonTitle
                otherButtonTitles:(NSArray *)otherButtons
                          dismiss:(UIAlertViewDismissBlock)dismissBlock
                           cancel:(UIAlertViewCancelBlock)cancelBlock;

@end