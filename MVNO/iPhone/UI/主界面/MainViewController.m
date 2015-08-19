//
//  MainViewController.m
//  MVNO
//
//  Created by beautyx on 15-3-20.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "MainViewController.h"
#import "HomeVC.h"
#import "ServiceVC.h"
#import "AccountVC.h"
#import "ProductVC.h"


#define TABBAR_BUTTON_W     80
#define TABBAR_BUTTON_H     40
#define TABBAR_SELINDEX     1   //定位在哪个TAB


@interface MainViewController ()

-(void)_initViewController;

@end

@implementation MainViewController
@synthesize midButton;



-(void)viewWillAppear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建自定义tabbar
    [self _initTabBarView];
    [self _initViewController];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//初始化子控制器
-(void)_initViewController{
    
    
    HomeVC *homeVC = [[HomeVC alloc] initAndHiddenTabBar:NO hiddenLeftButton:YES];
    
    ServiceVC *serviceVC = [[ServiceVC alloc] initAndHiddenTabBar:NO hiddenLeftButton:YES]; 
    
    
    AccountVC *accountVC = [[AccountVC alloc] initAndHiddenTabBar:NO hiddenLeftButton:YES];

    
    NSArray *views = @[homeVC,serviceVC,accountVC];
    
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:3];
    
    for (UIViewController *viewController in views) {
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
        // 监听nav的push动作来隐藏tabbar
        nav.delegate = self;
        [viewControllers addObject:nav];
    }
    self.viewControllers = viewControllers;
    
//    初次启动应用时定位到 我的华翔
    
    NSInteger selIndex = TABBAR_SELINDEX;
    
    self.selectedIndex = selIndex;
    
}


//初始化工具栏
//微薄自定义tabbar
-(void)_initTabBarView{
    
    
    //删除现有的tabBar
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    _tabBarView = [[UIImageView alloc] initWithFrame:rect];
    _tabBarView.userInteractionEnabled = YES; //这一步一定要设置为YES，否则不能和用户交互
    _tabBarView.image = [UIImage imageNamed:@"nav_tabbar"];
    [self.view addSubview:_tabBarView];
    
    aryImage = [NSMutableArray arrayWithObjects:@"home",@"pubilsh",@"goods", nil];
    
    arySelImage = [NSMutableArray arrayWithObjects:@"home2",@"pubilsh_hover",@"goods2", nil];

    
    [self creatButtonWithNormalName:aryImage[0] andSelectName:arySelImage[0]  andIndex:0];
    [self addCenterButtonWithImage:[UIImage imageNamed:@"pubilsh"] selectedImage:[UIImage imageNamed:@"pubilsh_hover"]];
    [self creatButtonWithNormalName:aryImage[2] andSelectName:arySelImage[2]  andIndex:2];
    
}

#pragma mark 创建一个按钮
- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected  andIndex:(NSInteger)index
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat buttonW = _tabBarView.frame.size.width / 3;
    CGFloat buttonH = _tabBarView.frame.size.height;
    button.frame = CGRectMake(100 *index, 0, buttonW, buttonH);
    [_tabBarView addSubview:button];

    //添加图标
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake((button.bounds.size.width-40)/2, 4, 50, 40)];
    imageView.tag = 200+index;
    imageView.image = [UIImage imageNamed:aryImage[index]];
    [button addSubview:imageView];
    
    
    button.tag = index;//设置按钮的标记, 方便来索引当前的按钮,并跳转到相应的视图
    
    //带参数的监听方法记得加"冒号"
    [button addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置刚进入时,第一个按钮为选中状态
    
    NSInteger selIndex = TABBAR_SELINDEX;
    if (selIndex == index) {
        
        imageView.image = [UIImage imageNamed:arySelImage[selIndex]];
        button.selected = YES;
        self.selectedBtn = button;  //设置该按钮为选中的按钮
    }
    
    
    
}

#pragma mark - addCenterButton
// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage
{
    midButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [midButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    midButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    midButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [midButton setImage:buttonImage forState:UIControlStateNormal];
    [midButton setImage:selectedImage forState:UIControlStateSelected];
    
    //  这个比较恶心  去掉选中button时候的阴影
    midButton.adjustsImageWhenHighlighted=NO;
    
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
    {
        //        button.center = self.tabBar.center ;
        
        [midButton setCenter:CGPointMake(self.tabBar.center.x, self.tabBar.center.y - 15)];
    }
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        midButton.center = center;
    }
    
    [self.view addSubview:midButton];
}

-(void)pressChange:(id)sender
{
    self.selectedIndex=1;
    midButton.selected=YES;
    
    
    //设置所有按钮的状态
    for (NSInteger i =0 ; i< aryImage.count ; i++) {
        
        UIImageView *imgView = (UIImageView *)[self.view viewWithTag:200+i];
        imgView.image = [UIImage imageNamed:aryImage[i]];
            
    }
}


#pragma mark 按钮被点击时调用

//自定义TabBar的按钮点击事件
- (void)clickBtn:(UIButton *)button
{
    
    if (0 == button.tag) {
        
        NSLog(@"login = %d",[[MVNOUser currentUser] isLogined]);
        
    }
    
    //设置所有按钮的状态
    for (NSInteger i =0 ; i< aryImage.count ; i++) {
        
        UIImageView *imgView = (UIImageView *)[self.view viewWithTag:200+i];
        
        if(i == button.tag){
            
            imgView.image = [UIImage imageNamed:arySelImage[i]];
            
        }else{
            
            imgView.image = [UIImage imageNamed:aryImage[i]];
     
        }

    }
    
    //1.先将之前选中的按钮设置为未选中
    self.selectedBtn.selected = NO;
    //2.再将当前按钮设置为选中
    button.selected = YES;
    //3.最后把当前按钮赋值为之前选中的按钮
    self.selectedBtn = button;
    //4.跳转到相应的视图控制器. (通过selectIndex参数来设置选中了那个控制器)
    self.selectedIndex = button.tag;
    
    
}




-(void)showLoginView{

//    LoginViewController *loginVC = [[LoginViewController alloc]initAndHiddenTabBar:YES hiddenLeftButton:NO];
//    loginVC.hidesBottomBarWhenPushed = YES;
//
//    [self presentViewController:[[UINavigationController alloc]initWithRootViewController:loginVC] animated:NO completion:nil];
    

}

#pragma mark --- UINavigationControllerDelegate
// Called when the navigation controller shows a new top view controller via a push, pop or setting of the view controller stack.


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (viewController.hidesBottomBarWhenPushed) {
        
        _tabBarView.hidden = YES;
        
    } else {
        
        _tabBarView.hidden = NO;

    }
    
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
