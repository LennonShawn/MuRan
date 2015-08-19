//
//  PieView.h
//  PieSample
//
//  Created by Cooriyou on 14-5-27.
//  Copyright (c) 2014年 AILK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView
@property (assign, nonatomic)BOOL canSelected;

@property (strong, nonatomic)NSMutableArray * used_balanceColor;
@property (strong, nonatomic)NSMutableArray * used_balanceAmount;


@property (strong, nonatomic)NSMutableArray * detailListArr;
@property (strong, nonatomic)NSMutableArray * detailcolorArray;

@property (strong, nonatomic)NSMutableArray * used_balanceList;
@property (strong, nonatomic)NSMutableArray * detailList;

@property (strong, nonatomic)UIView * graphicView;

//- (id)initWithFrame:(CGRect)frame resBooklist:(NSArray *)resBooklist title:(NSString* )title;

- (id)initWithFrame:(CGRect)frame resBooklist:(NSArray *)resBooklist title:(NSString* )title colors:(NSArray *)colors;


@end
