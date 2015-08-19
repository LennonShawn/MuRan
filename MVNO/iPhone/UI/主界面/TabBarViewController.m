//
//  TabBarViewController.m
//  tabBarViewController
//
//  Created by Bc_Ltf on 15/3/25.
//  Copyright (c) 2015年 Bc_ltf. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation TabBarViewController
@synthesize button;
@synthesize myTabBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- setup
-(void)setup
{
    //  添加突出按钮
//    [self addCenterButtonWithImage:[UIImage imageNamed:@"main"] selectedImage:[UIImage imageNamed:@"mainH"]];
    
    [self addCenterButtonWithImage:[UIImage imageNamed:@"pubilsh"] selectedImage:[UIImage imageNamed:@"pubilsh_hover"]];
    //  UITabBarControllerDelegate 指定为自己
    self.delegate=self;
    //  指定当前页——中间页
    self.selectedIndex=2;
    //  设点button状态
    button.selected=YES;
    //  设定其他item点击选中颜色
    myTabBar.tintColor= [UIColor colorWithRed:222/255.0 green:78/255.0 blue:22/255.0 alpha:1];
}


#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    button.adjustsImageWhenHighlighted=NO;
    
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
    {
//        button.center = self.tabBar.center ;

        [button setCenter:CGPointMake(self.tabBar.center.x, self.tabBar.center.y - 15)];
    }
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
}

-(void)pressChange:(id)sender
{
    self.selectedIndex=2;
    button.selected=YES;
}

#pragma mark- TabBar Delegate

//  换页和button的状态关联上

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex==2) {
        button.selected=YES;
    }else
    {
        button.selected=NO;
    }
}

@end
