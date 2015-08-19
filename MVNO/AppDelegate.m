//
//  AppDelegate.m
//  MVNO
//
//  Created by beautyx on 15-3-17.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "AppDelegate.h"
#import "MVNOUser.h"
#import "DDMenuController.h"
#import "RightSideDrawVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    _mainCtrl = [[MainViewController alloc]init];
    RightSideDrawVC *rightCtrl = [[RightSideDrawVC alloc]initAndHiddenTabBar:NO hiddenLeftButton:NO];
    _menuCtrl = [[DDMenuController alloc]initWithRootViewController:_mainCtrl];
    _menuCtrl.rightViewController = rightCtrl;
    
    self.window.rootViewController = _menuCtrl;
    
    NSTimeInterval timeInterval =180.0 ;
    //定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                  target:self
                                                selector:@selector(reSetLogInId)
                                                userInfo:nil
                                                 repeats:YES];
    
    [self.timer fire];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)reSetLogInId
{
    if ([[MVNOUser currentUser] getNow_logInID].length >0 ) {
        [[MVNOUser currentUser] saveLast_logInID:[[MVNOUser currentUser] getNow_logInID]];
        [[MVNOUser currentUser] saveNow_logInID:[NSString stringWithFormat:@"%d",[Tools getRandomNumber:0 to:10000]]];
        [[NSNotificationCenter defaultCenter] postNotificationName:RELOADDATA object:nil];
    }
    
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}

//禁止所有的第三方输入法在他们的应用中运行
-(BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(NSString *)extensionPointIdentifier{
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
