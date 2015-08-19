//
//  TipsView.m
//  Statements
//
//  Created by Cooriyou on 14-5-28.
//  Copyright (c) 2014年 Moncter8. All rights reserved.
//

#import "TipsView.h"

@interface TipsView()

@property(nonatomic,strong)UILabel* lbResidual;


@end

@implementation TipsView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *selView = [[UIImageView alloc]init];
        selView.image = [UIImage imageNamed:@"PieChartSelect.png"];
        selView.frame = CGRectMake(0, 0, 185, 40);
        [self addSubview:selView];
        
        self.lbName = [[UILabel alloc]initWithFrame:CGRectMake(3, 10, 45, 15)];
        _lbName.font = [UIFont systemFontOfSize:11];
        _lbName.textColor = [self colorFromHexRGB:@"646464"];
        _lbName.backgroundColor = [UIColor clearColor];
        _lbName.text = @"未知";
        [self addSubview:_lbName];
        
        /*
        self.lbUsed = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width/2, 18)];
        _lbUsed.font = [UIFont systemFontOfSize:12];
        _lbUsed.textAlignment = NSTextAlignmentRight;
        _lbUsed.textColor = [self colorFromHexRGB:@"646464"];
        _lbUsed.backgroundColor = [UIColor clearColor];
        _lbUsed.text = @"已用：0";
        [self addSubview:_lbUsed];
        */
        
        self.lbUsed = [[UILabel alloc]initWithFrame:CGRectMake(20, 22, self.frame.size.width/2 * 3 - 60, 18)];
        _lbUsed.font = [UIFont systemFontOfSize:10];
        _lbUsed.textAlignment = NSTextAlignmentLeft;
        _lbUsed.textColor = [self colorFromHexRGB:@"646464"];
        _lbUsed.backgroundColor = [UIColor clearColor];
        _lbUsed.text = @"已用：0 剩余：0";
        [self addSubview:_lbUsed];
        
        self.lbResidual = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2, 20, self.frame.size.width/2 + 100, 18)];
        _lbResidual.font = [UIFont systemFontOfSize:12];
        _lbResidual.textAlignment = NSTextAlignmentLeft;
        _lbResidual.textColor = [self colorFromHexRGB:@"646464"];
        _lbResidual.backgroundColor = [UIColor clearColor];
        _lbResidual.text = @"剩余：0";
        //[self addSubview:_lbResidual];
        
    }
    return self;
}

- (void)setInfo:(NSDictionary* )dic
{
    if ([dic count] == 0) {
        return;
    }
    BOOL isKB = NO;
    NSString* name = [dic objectForKey:@"useType"];
    if([name length] == 0){
        name = @"未知类型";
    }
    _lbName.text = name;
    
    if ([name isEqual:@"短信"]== YES){
        isKB = YES;
    }
    
    NSString* used = [dic objectForKey:@"usedAmount"];
    if([used length] == 0){
        used = @"已用：未知";
    }
    if (isKB == YES) {
        _lbUsed.text = [NSString stringWithFormat:@"%d",(used.intValue/1024)];
    }else{
        _lbUsed.text = used;
    }
    
    NSString* residual = [dic objectForKey:@"balanceAmount"];
    if([residual length] == 0){
        residual = @"剩余：未知";
    }
    if (isKB == YES) {
        _lbResidual.text = [NSString stringWithFormat:@"%d",(residual.intValue/1024)];
    }else{
        _lbResidual.text = residual;
    }

    
    
    return;
}

- (UIColor *) colorFromHexRGB:(NSString *) inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
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
