//
//  TipsView.h
//  Statements
//
//  Created by Cooriyou on 14-5-28.
//  Copyright (c) 2014年 Moncter8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsView : UIView

@property(nonatomic,strong)UILabel* lbName;
@property(nonatomic,strong)UILabel* lbUsed;

- (void)setInfo:(NSDictionary* )dic;


@end
