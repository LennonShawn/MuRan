//
//  Tools.h
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

// 3des加密引入
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import <Security/Security.h>

//#include <ifaddrs.h>
//#import <dlfcn.h>

//#import <SystemConfiguration/SystemConfiguration.h>

UIInterfaceOrientation markOrientate;

@interface Tools : NSObject

// 打电话功能
+ (BOOL) makeCall:(NSString *)phoneNumber;

//在view中显示提示信息
+ (void)showSpinnerInView:(UIView *)view prompt:(NSString *)prompt;
+ (void)hideSpinnerInView:(UIView *)view;
+ (void)showPrompt:(NSString *)prompt inView:(UIView *)view delay:(NSTimeInterval)delay;

//根据文件名获取图片
+ (UIImage *)imageWithName:(NSString *)name;

//创建label
+ (UILabel *)createLabel:(NSString *)content color:(UIColor *)color font:(UIFont *)font;
+ (UILabel *)createLabel:(NSString *)content frame:(CGRect)frame color:(UIColor *)color font:(UIFont *)font aliment:(NSTextAlignment)aliment;

// 创建slider
+ (UISlider *)createSliderViewWithFrame:(CGRect)frame andMaxiImage:(NSString *)maxiImageStr  andMiniImage:(NSString *)miniImageStr  andThumbImage:(NSString *)thumbImageStr andTarget:(id)taget andAction:(SEL)action;

//创建button

+ (UIButton *)createButtonWithText:(NSString *)text
                            target:(id)target
                            action:(SEL)action;
+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                           highlitedImage:(NSString *)highlited
                                   target:(id)target 
                                   action:(SEL)action;

+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                            selectedImage:(NSString *)highlited
                                   target:(id)target 
                                   action:(SEL)action;
//创建navbar
+ (UIBarButtonItem *)createNavButtonItem:(NSString *)normal
                                selected:(NSString *)selected
                                  target:(id)taget
                                  action:(SEL)action;
// 创建没有选中图片的navbar
+ (UIBarButtonItem *)createNavButtonItem:(NSString *)normal
                                  target:(id)taget
                                  action:(SEL)action;
//用MD5加密key，用来为要存储的文件命名
+ (NSString *)cachePathForKey:(NSString *)key;

//检查本地是不是存在输入的路径
+ (UIImage *)isExitInLocal:(NSString *)path;
//+ (NSString *)hostname;
//+ (NSString *)localIPAddress;
//+ (NSString *)localWiFiIPAddress;
//+ (NSString *)whatismyipdotcom;
//获取当前的版本号
+ (NSString *)urlWithVersion;

//存放和读取保存在本地的登录信息以及分享内容
+ (void)saveLoginInfo:(NSArray *)infos;
+ (NSArray *)getLocalLoginInfo;

//适配方法
+ (float)getCurrentDistinction;

//获取硬件地址
+ (NSString *)macaddress;
+(void)reSetLogId;
+(void)reSetUserId;
+(void)setUserIdEqual;
//判断设备是否越狱
+ (BOOL)isJailbroken;

//判断内置购买是否装了插件
+ (BOOL)putStringToItunes:(NSData*)iapData;

//判断当前的网络
+(NSString*)GetCurrntNet;

// 判断网络是否可用
+ (BOOL) checkNetworkIsValid;


//计算文件夹文件容量
+(long)fileSizeForDir:(NSString *)path;

//统一controller的标题
+ (UILabel *)createTitleLabel:(NSString *)title;

// 3DES加密
+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt;

// 特殊字符转码
+ (NSString *)encodeToPercentEscapeString: (NSString *) input;
// 特殊字符解码
+ (NSString *)decodeFromPercentEscapeString: (NSString *) input;

// 手机号码验证
+(BOOL) isValidateMobile:(NSString *)mobile;
//获取随机数
+(int)getRandomNumber:(int)from to:(int)to;
//获取时间戳
+(NSString *)getCurrentTime;
+(int)getTimeDifference:(NSString *)date_last;
+ (void)showLoginView;

@end
