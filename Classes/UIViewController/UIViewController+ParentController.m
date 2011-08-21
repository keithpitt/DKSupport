//
//  UIViewController+ParentController.m
//  DiscoKit
//
//  Created by Keith Pitt on 1/03/11.
//  Copyright 2011 Mostly Disco. All rights reserved.
//

#import "UIViewController+ParentController.h"

@implementation UIViewController (parentController)

- (void)setParentController:(UIViewController*)parent {
	[self setValue:parent forKey:@"_parentViewController"];
}

@end