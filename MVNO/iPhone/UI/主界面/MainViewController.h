//
//  MainViewController.h
//  MVNO
//
//  Created by beautyx on 15-3-20.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MainViewController : UITabBarController<UINavigationControllerDelegate>
{
    
    UIImageView *_tabBarView; //自定义的覆盖原先的tarbar的控件
    
    NSArray *aryImage;    //未选中时的图片
    NSArray *arySelImage; //选中时的图片
}

//设置之前选中的按钮
@property (nonatomic,strong) UIButton *selectedBtn;
//  这里是这页突出的按钮
@property(nonatomic,strong) UIButton *midButton;
@end
