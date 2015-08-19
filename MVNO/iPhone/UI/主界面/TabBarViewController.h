//
//  TabBarViewController.h
//  tabBarViewController
//
//  Created by Bc_Ltf on 15/3/25.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UITabBarController

//  这里是这页突出的按钮
@property(nonatomic,strong) UIButton *button;
//  tabBar
@property (strong, nonatomic) UITabBar *myTabBar;

@end
