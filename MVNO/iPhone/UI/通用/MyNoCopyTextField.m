//
//  MyNoCopyTextField.m
//  MVNO
//
//  Created by lisz5 on 14-3-20.
//  Copyright (c) 2014年 lishaozhou. All rights reserved.
//

#import "MyNoCopyTextField.h"

@implementation MyNoCopyTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    UIMenuController * menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}



@end
