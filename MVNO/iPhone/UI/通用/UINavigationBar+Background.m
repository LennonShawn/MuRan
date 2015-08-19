//
//  UINavigationBar+Background.m
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import "UINavigationBar+Background.h"

@implementation UINavigationBar (Background)

- (void)drawRect:(CGRect)rect
{
    UIImage *img = [UIImage imageNamed:@"navbar.png"];
    [img drawInRect:CGRectMake(0, 0, UISCREEN_WIDTH, 44)];
    
//    self.layer.masksToBounds = NO;
//    self.layer.shadowOffset = CGSizeMake(0, 3);
//    self.layer.shadowOpacity = 0.6;
//    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

- (void)didMoveToSuperview
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
            [self setBackgroundImage:[UIImage imageNamed:@"navbar_ios7.png"] forBarMetrics:UIBarMetricsDefault];
//            self.barTintColor = [UIColor redColor];
        } else {
            [self setBackgroundImage:[UIImage imageNamed:@"navbar.png"] forBarMetrics:UIBarMetricsDefault];
            
//            self.tintColor = [UIColor redColor];

        }
    }
//    self.layer.masksToBounds = YES;
//    self.layer.shadowOffset = CGSizeMake(0, -3);
//    self.layer.shadowOpacity = 0.6;
//    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    
    
    [super didMoveToSuperview];
}

@end
