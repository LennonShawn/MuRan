//
//  AppDelegate.h
//  MVNO
//
//  Created by beautyx on 15-3-17.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@class DDMenuController;
@class RightSideDrawVC;


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    
}

@property (strong, nonatomic)   UIWindow *window;
//@property (strong, nonatomic) UIViewController * rightSideDrawerViewController;
//@property (strong, nonatomic) UIViewController *centerViewController;
@property (nonatomic,strong)    MainViewController *mainCtrl;
@property (nonatomic,retain)    DDMenuController *menuCtrl;
@property (strong, nonatomic)   NSTimer *timer;


@end


