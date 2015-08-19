//
//  HomeVC.m
//  MVNO
//
//  Created by beautyx on 15-5-27.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "HomeVC.h"
#import "WebViewVC.h"
#import "DDMenuController.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavTitle:@"广场"];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,45,45)];
    [rightButton setImage:[UIImage imageNamed:@"man.png"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(showPopMenu:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
    
    
}

-(void)showPopMenu:(id)sender{


    NSLog(@"点击了右边侧滑菜单");
  
    [(DDMenuController *)[UIApplication sharedApplication].delegate.window.rootViewController showRightController:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
