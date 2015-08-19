//
//  ReaderViewController.m
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import "MVNOViewController.h"
#import "AppDelegate.h"

#define screenHeight [UIScreen mainScreen].bounds.size.height
#define screenWidth [UIScreen mainScreen].bounds.size.width

@interface MVNOViewController ()

@end

@implementation MVNOViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initAndHiddenTabBar:(BOOL)hiddenTabBar hiddenLeftButton:(BOOL)hideLeft
{
     self = [super init];
    if (self) {
        _hideTabbar = hiddenTabBar;
        _hideLeftButton = hideLeft;
        
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{    
    [super viewWillAppear:animated];
    
 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建底背景
    UIImage * bgImage = [UIImage imageNamed:IMAGR_BLACKGROUND];
    self.view.layer.contents = (id)bgImage.CGImage;
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;

    if (_hideLeftButton) {
        
        self.navigationItem.hidesBackButton = YES;

    }
    else {
 
        [self setCustomBackButton];
    }
    
}

-(UIBarButtonItem*)getCustomBarButton:(SEL)selector
                                image:(NSString*)imageName
                            imageSize:(CGSize)size
                                 left:(BOOL)bLeft{
    CGRect rect = CGRectMake(0,0, size.width ,size.height);
    UIButton* barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [barButton setFrame:rect];
    [barButton setShowsTouchWhenHighlighted:YES];
    [barButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (bLeft) {
        [barButton setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        [barButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 10)];
    }else{
        [barButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    }
    
    [barButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:barButton];
    return [barItem autorelease];
    

}

-(void)setCustomBackButton{
    // 17 23 
    UIBarButtonItem *backItem = [self getCustomBarButton:@selector(backButtonPressed:)
                                                   image:@"nav_backbar"
                                               imageSize:CGSizeMake(23, 23)
                                                    left:YES];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setNavTitle:(NSString *)title{
    
    UIFont * font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20];
    //[UIFont systemFontOfSize:20]
//    UILabel *titleLable = [Tools createLabel: title
//                            frame:CGRectMake(0, 0, 200, 30)
//                            color:RGBCOLOR(245, 245, 245)
//                            font:font
//                            aliment:NSTextAlignmentCenter];
//    self.navigationItem.titleView = titleLable;

    self.title = title;
}


- (void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showPrompt:(NSString *)prompt inView:(UIView *)view follow:(void (^)(void))follow
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = prompt;
    [hud hide:YES afterDelay:1.2];
    hud.removeFromSuperViewOnHide = YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            follow();
        });
    });
}

//收到推送通知后，实现页面跳转
- (void)notificationJumpDetail:(NSNotification *)notification
{
    //在子类的五个视图内实现
}

- (void)jumpBookDetailControllerWithController:(UIViewController*)detail
{
    UINavigationController* bookDetail = [[[UINavigationController alloc]initWithRootViewController:detail] autorelease];
    [self.navigationController pushViewController:bookDetail animated:YES];
}

-(void)setupRightMenuButton{
    //w_nav_rightbutton
    UIBarButtonItem * rightDrawerButton =    [Tools createNavButtonItem:@"w_nav_rightbutton"  target:self action:@selector(rightDrawerButtonPress:)];
    

    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
}



-(BOOL)shouldAutorotate  
{  
    return NO;
}  

-(NSUInteger)supportedInterfaceOrientations  
{  
    return UIInterfaceOrientationPortrait;  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation

{
    
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    
}

@end
