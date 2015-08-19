//
//  RightSideDrawViewController.m
//  MVNO
//
//  Created by beautyx on 15-8-5.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "RightSideDrawVC.h"

@interface RightSideDrawVC ()

@end

@implementation RightSideDrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(140, 180, 150, 50)];
    lb.backgroundColor = [UIColor whiteColor];
    lb.text = @"右滑菜单";
    lb.textColor = [UIColor redColor];
    lb.textAlignment = NSTextAlignmentRight;
    lb.Font = [UIFont systemFontOfSize:30.0f];
    
    [self.view addSubview:lb];
    
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
