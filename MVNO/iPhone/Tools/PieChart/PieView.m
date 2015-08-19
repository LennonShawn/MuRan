//
//  PieView.m
//  PieSample
//
//  Created by Cooriyou on 14-5-27.
//  Copyright (c) 2014年 AILK. All rights reserved.
//

#import "PieView.h"
#import "PieChartView.h"
#import "TipsView.h"

@interface PieView ()<PieChartDelegate>

@property(strong,nonatomic)PieChartView* pieChartView;
@property(strong,nonatomic)TipsView* tipsView;
@property(strong,nonatomic)NSArray* resList;

@property(strong,nonatomic)NSMutableArray * evelist;

@property(assign,nonatomic)BOOL inOut;
@end

@implementation PieView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame value:(NSMutableArray *)valueArr tips:(NSMutableArray *)tipsArr{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.canSelected = YES;
        
        NSMutableArray* colorArray = [NSMutableArray arrayWithObjects:
                           [self colorFromHexRGB:@"ff677b"],
                           [self colorFromHexRGB:@"14cee4"],
                           [self colorFromHexRGB:@"ffac4b"],
                           nil];
        
        self.pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 100) withValue:valueArr withColor:colorArray];
        self.pieChartView.delegate = self;
        [self.pieChartView setTitleText:@"短信剩余"];
        
        [self addSubview:_pieChartView];
        [self.pieChartView reloadChart];
        self.tipsView = [[TipsView alloc]initWithFrame:CGRectMake(((self.frame.size.width - 185)/2),self.frame.size.height - 90 , 185, 40)];
        [self addSubview:_tipsView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame resBooklist:(NSArray *)resBooklist title:(NSString* )title colors:(NSArray *)colors{
    self = [super initWithFrame:frame];
    self.inOut = YES;
    if (self) {
        
//        NSMutableArray* colorArray = [NSMutableArray array];
        self.resList = resBooklist;
        self.detailcolorArray = [NSMutableArray array];
        self.used_balanceColor = [NSMutableArray array];
        self.used_balanceAmount = [NSMutableArray array];
        self.detailListArr = [NSMutableArray array];
        self.used_balanceList = [NSMutableArray array];
        self.detailList = [NSMutableArray array];
        if ([_resList count] <= 0) {
            [self.used_balanceColor addObject:[self colorFromHexRGB:@"646464"]];
            [self.used_balanceList addObject:[NSNumber numberWithInt:1]];
        }else{
            int count = [_resList count] / 3;
            if ([_resList count]%3 != 0) {
                count ++;
            }
            
                for (int i = 0; i <= count; i ++) {
                    [self.used_balanceColor addObject:[self colorFromHexRGB:colors[0]]];
                    [self.used_balanceColor addObject:[UIColor grayColor]];
                }
            
                for (int i = 0; i <= count; i ++) {
                    [self.detailcolorArray addObject:[self colorFromHexRGB:colors[0]]];
                    [self.detailcolorArray addObject:[self colorFromHexRGB:colors[1]]];
                    [self.detailcolorArray addObject:[self colorFromHexRGB:colors[2]]];
                }
            
            NSInteger u_bTotal = 0;
            NSInteger detailTotal = 0;
            NSInteger balanceAmount = 0;
//            NSMutableArray* amountList = [NSMutableArray array];
            NSInteger useAmount = 0;
            for (NSDictionary* dic in _resList)
            {
//                [amountList addObject:[dic objectForKey:@"balanceAmount"]];
                NSNumber* num = [dic objectForKey:@"balanceAmount"];
                balanceAmount  += [num intValue];
                
                //已使用数量－总量
                NSInteger num_use = [[dic objectForKey:@"usedAmount"] integerValue];
                useAmount +=num_use;
                
            [self.detailListArr addObject:num];
                
            }
            [self.used_balanceAmount addObject:[NSNumber numberWithInt:balanceAmount]];
            [self.used_balanceAmount addObject:[NSNumber numberWithInt:useAmount]];
            
            NSLog(@"amountList%@--%@",self.used_balanceAmount,self.detailListArr);
            
            u_bTotal = balanceAmount + useAmount;

            detailTotal = balanceAmount;
            
            if (u_bTotal <= 0)
            {
                u_bTotal = 1;
            }
            if (detailTotal <= 0)
            {
                detailTotal = 1;
            }
            
            for (NSNumber* num in self.used_balanceAmount)
            {
                Float32 value = ([num floatValue]*10)/u_bTotal;
                if (value < 1 && value > 0) {
                    value = 1.0;
                }
                [self.used_balanceList addObject:[NSNumber numberWithInt:value]];
            }
            NSLog(@"u_blist%@",self.used_balanceAmount);
            for (NSNumber* num in self.detailListArr)
            {
                Float32 value = ([num floatValue]*10)/detailTotal;
                if (value < 1 && value > 0) {
                    value = 1.0;
                }
                [self.detailList addObject:[NSNumber numberWithInt:value]];
            }
            NSLog(@"detailList%@",self.detailList);
            
           
        } // end count >0
        
        self.pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 45) withValue:self.used_balanceList withColor:self.used_balanceColor];
        
        self.pieChartView.delegate = self;
        [self.pieChartView.rotatedView.pieChart setShowPercentage:YES];
        [self.pieChartView setTitleText:title];
        [self addSubview:_pieChartView];
        
        [self.pieChartView reloadChart];
        
        self.tipsView = [[TipsView alloc]initWithFrame:CGRectMake(((self.frame.size.width - 185)/2),self.frame.size.height - 40 , 185, 40)];
        [self addSubview:_tipsView];
        self.tipsView.hidden = YES;
        if (IS_IPHONE_5)
        {
            self.graphicView = [[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-30,50,76)];
        }else
        {
            self.graphicView = [[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-60,50,76)];
        }
        

        [self addGraphicView];
        
        self.graphicView.hidden = NO;
    }
    return self;
}

-(void)addGraphicView
{
    NSInteger  sum = 0;
    
    for (NSNumber * num in self.used_balanceAmount)
    {
        sum+=[num integerValue];
    }
    
   float balacePer = [self.used_balanceAmount[0] integerValue]*100.00/sum;
    
    float usedPer = [self.used_balanceAmount[1] integerValue]*100.00/sum;
    
    UIView * usedView = [[UIView alloc]initWithFrame:CGRectMake(0,0,22,22)];
    usedView.backgroundColor = self.used_balanceColor[1];
    [self.graphicView addSubview:usedView];
    UILabel * used_lb = [[UILabel alloc]initWithFrame:CGRectMake(28, 0, 44, 22)];
    used_lb.text = @"已用:";
    used_lb.backgroundColor = [UIColor clearColor];
    used_lb.textAlignment = 1;
    used_lb.font = [UIFont boldSystemFontOfSize:10];
    UILabel * used_perLb = [[UILabel alloc]initWithFrame:CGRectMake(55, 0, 44, 22)];
    used_perLb.text = [NSString stringWithFormat:@"%@%%",[self decimalwithFormat:@"0" floatV:usedPer]];
    used_perLb.textAlignment = 1;
    used_perLb.backgroundColor = [UIColor clearColor];
    used_perLb.font = [UIFont boldSystemFontOfSize:10];
    [self.graphicView addSubview:used_perLb];
    [self.graphicView addSubview:used_lb];
    
    UIView * balanceView = [[UIView alloc]initWithFrame:CGRectMake(0,32,22,22)];
    balanceView.backgroundColor = self.used_balanceColor[0];
    [self.graphicView addSubview:balanceView];
    UILabel * balance_lb = [[UILabel alloc]initWithFrame:CGRectMake(28,32, 44, 22)];
    balance_lb.text = @"剩余:";
    balance_lb.backgroundColor = [UIColor clearColor];
    balance_lb.textAlignment = 1;
    balance_lb.font = [UIFont boldSystemFontOfSize:10];
    UILabel * balance_perLb = [[UILabel alloc]initWithFrame:CGRectMake(55, 32, 44, 22)];
    balance_perLb.text = [NSString stringWithFormat:@"%@%%",[self decimalwithFormat:@"0" floatV:balacePer]];
    balance_perLb.textAlignment = 1;
    balance_perLb.backgroundColor = [UIColor clearColor];
    balance_perLb.font = [UIFont boldSystemFontOfSize:10];
    [self.graphicView addSubview:balance_perLb];
    [self.graphicView addSubview:balance_lb];
    [self addSubview:self.graphicView];
    
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
- (void)selectedFinish:(PieChartView *)pieChartView index:(NSInteger)index percent:(float)per
{
    NSLog(@"Index:%d",index);
    if (!self.inOut )
    {
        if ([_resList count] <= 0) {
            return;
        }
        
        NSDictionary* dic = [_resList objectAtIndex:index];
        
        if ([[dic objectForKey:@"unitName"] isEqualToString:@"kb"] == YES) {
            self.tipsView.lbName.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"useType"]];
            NSNumber* used = [dic objectForKey:@"usedAmount"];
            NSString* balance = [dic objectForKey:@"balanceAmount"];
            //        NSInteger nUsed = 0;
            //        if (used.intValue != 0) {
            //            nUsed = used.intValue/1024;
            //        }
            float nUsed = 0;
            if (used.intValue != 0) {
                nUsed = used.intValue / 1024.0f;
            }
            /*
             self.tipsView.lbUsed.text = [NSString stringWithFormat:@"已用 : %.2f %@",nUsed, @"MB"];
             self.tipsView.lbResidual.text = [NSString stringWithFormat:@"剩余 : %.2f %@",(balance.intValue * 100 / 1024) / 100.0f, @"MB"];*/
            self.tipsView.lbUsed.text = [NSString stringWithFormat:@"已用 : %.2f %@  剩余 : %.2f %@" ,nUsed, @"MB" ,(balance.intValue * 100 / 1024) / 100.0f, @"MB"];
            
            
            // 已用：0 剩余：0
        }else{
            
            self.tipsView.lbName.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"useType"]];
            /*
             self.tipsView.lbUsed.text = [NSString stringWithFormat:@"已用 : %@ %@",[dic objectForKey:@"usedAmount"], [dic objectForKey:@"unitName"]];
             self.tipsView.lbResidual.text = [NSString stringWithFormat:@"剩余 : %@ %@",[dic objectForKey:@"balanceAmount"], [dic objectForKey:@"unitName"]];
             */
            self.tipsView.lbUsed.text = [NSString stringWithFormat:@"已用 : %@ %@  剩余 : %@ %@",[dic objectForKey:@"usedAmount"], [dic objectForKey:@"unitName"], [dic objectForKey:@"balanceAmount"], [dic objectForKey:@"unitName"]];
            
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)onCenterClick:(PieChartView *)pieChartView
{
    
    NSLog(@"我点了中间");
    
    
    
    self.inOut = !self.inOut;
    self.pieChartView.delegate = nil;
    [self.pieChartView removeFromSuperview];
    self.pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 45) withValue:self.inOut?self.used_balanceList:self.detailList withColor:self.inOut?self.used_balanceColor:self.detailcolorArray];
    self.pieChartView.delegate = self;
    [self addSubview:self.pieChartView];
    [self.pieChartView reloadChart];
    
    if (self.inOut) {
        [self.pieChartView setTitleText:@"详情"];
        
        self.tipsView.hidden = YES;
        self.graphicView.hidden = NO;
    }else{
        [self.pieChartView setTitleText:@"返回"];
        self.tipsView.hidden = NO;
        self.graphicView.hidden = YES;
    }
    
    
    
}
- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}

@end
