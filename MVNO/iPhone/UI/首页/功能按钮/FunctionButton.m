//
//  FunctionButton.m
//  MVNO
//
//  Created by lisz5 on 14-3-6.
//  Copyright (c) 2014年 lishaozhou. All rights reserved.
//

#import "FunctionButton.h"

@implementation FunctionButton


- (id)initWithFrame:(CGRect)frame withIconImage:(NSString *)iconImage andText:(NSString *)labelText andTag:(int)tag
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = tag * tag;
        // 数据配置
        CGFloat width = frame.size.width;
        UIImage * btnImage = [Tools imageWithName:iconImage];
        // 创建Button
        iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        iconBtn.frame = CGRectMake(0, 0, width, width);
        [iconBtn setImage:btnImage forState:UIControlStateNormal];
        [iconBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:iconBtn];
        iconBtn.tag = tag;
        // 创建label
        CGFloat lblStartY = CGRectGetMaxY(iconBtn.frame);
        UILabel * lblBelow = [[UILabel alloc]initWithFrame:CGRectMake(0, lblStartY + 3, width+10, 21)];
        [self addSubview:lblBelow];
        [lblBelow release];
        [lblBelow setBackgroundColor:[UIColor clearColor]];
        [lblBelow setText:labelText];
        [lblBelow setTextAlignment:NSTextAlignmentCenter];
        [lblBelow setTextColor:RGBCOLOR(66, 66, 66)];
        [lblBelow setFont:[UIFont systemFontOfSize:12]];
        
    }
    return self;
}

- (void)setButtonEnable:(BOOL)ok{
    iconBtn.enabled = ok;
}

- (void)btnClicked:(UIButton *)btn{
    
    [self.delegate functionButtonClicked:btn];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
