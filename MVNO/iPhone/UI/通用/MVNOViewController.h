//
//  MVNOViewController.h
//  MVNO
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

//所有的类都需要继承自他,用来设定是否隐藏返回按钮和底部的Tabbar.
@interface MVNOViewController : UIViewController
{
@private
    BOOL _hideTabbar;//用来控制底部的Tabbar是否隐藏
    BOOL _hideLeftButton;//用来控制是否隐藏返回按钮
}

- (id)initAndHiddenTabBar:(BOOL)hiddenTabBar hiddenLeftButton:(BOOL)hideLeft;
- (id)init __attribute__((deprecated));//这个方法标记为过时了

- (void)setNavTitle:(NSString *)title;
- (void)backButtonPressed:(id)sender;
- (void)showPrompt:(NSString *)prompt inView:(UIView *)view follow:(void (^)(void))follow;

@end
