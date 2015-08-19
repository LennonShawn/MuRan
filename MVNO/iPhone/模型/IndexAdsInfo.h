//
//  IndexAdsInfo.h
//  
//
//  Created by lisz on 9/24/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  首页广告信息
 */
@interface IndexAdsInfo : NSObject
@property (nonatomic, copy  ) NSString *cartoonID;//漫画ID
@property (nonatomic, copy  ) NSString *fileURL;//广告链接
@property (nonatomic, copy  ) NSString *fileName;//名称
@property (nonatomic, copy  ) NSString *appLink;//网页跳转的地址
@property (nonatomic, assign) int  adType;//漫画类型，0为独家漫画，1为网络漫画 3：网页跳转，4：无操作

@end
