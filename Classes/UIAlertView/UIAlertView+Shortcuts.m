//
//  UIAlertView+Shortcuts.m
//  DiscoKit
//
//  Created by Keith Pitt on 12/06/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "UIAlertView+Shortcuts.h"

@implementation UIAlertView (Shortcuts)

static UIAlertViewDismissBlock _dismissBlock;
static UIAlertViewCancelBlock _cancelBlock;

+ (UIAlertView *)alertWithError:(NSError*)error title:(NSString*)title {
    
  return [self alertWithMessage:[error localizedDescription] title:title];
    
}

+ (UIAlertView *)alertWithMessage:(NSString*)message title:(NSString*)title {
    
  return [self alertWithMessage:message title:title cancelButtonTitle:NSLocalizedString(@"OK", nil)];
    
}

+ (UIAlertView *)alertWithMessage:(NSString*)message title:(NSString*)title cancelButtonTitle:(NSString *)cancelButtonTitle {
  
  return [self alertWithMessage:message title:title cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil dismiss:nil cancel:nil];
  
}

+ (UIAlertView *)alertWithMessage:(NSString *)message
                   title:(NSString *)title
       cancelButtonTitle:(NSString *)cancelButtonTitle
       otherButtonTitles:(NSArray *)otherButtons
                 dismiss:(UIAlertViewDismissBlock)dismissBlock
                  cancel:(UIAlertViewCancelBlock)cancelBlock {
  
  [_cancelBlock release], _cancelBlock = nil;
  if (cancelBlock)
    _cancelBlock  = [cancelBlock copy];
  
  [_dismissBlock release], _dismissBlock = nil;
  if(dismissBlock)
    _dismissBlock  = [dismissBlock copy];
  
  UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title
                                                      message:message
                                                     delegate:[self class]
                                            cancelButtonTitle:cancelButtonTitle
                                            otherButtonTitles:nil];
  
  for(NSString * buttonTitle in otherButtons)
    [alertView addButtonWithTitle:buttonTitle];
  
	[alertView show];
  
	return [alertView autorelease];
  
}

+ (UIAlertView *)alertView:(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  
	if(buttonIndex == [alertView cancelButtonIndex]) {
    if (_cancelBlock)
      _cancelBlock();
  } else {
    if (_dismissBlock)
      _dismissBlock(buttonIndex - 1); // cancel button is button 0
  }
  
  return alertView;
  
}

@end