//
//  MVNOUser.h
//  MVNO
//
//  Created by lisz5 on 14-3-14.
//  Copyright (c) 2014年 lishaozhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVNOUser : NSObject
/*
// 是否已登录
@property (nonatomic, assign) BOOL isLogined;
// 是否自动登录
@property (nonatomic, assign) BOOL isAutoLogin;
//是否欠费
@property (nonatomic, assign) BOOL isArrears;
// 用户名（手机或者邮箱）
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * telPhone;
// 密码
@property (nonatomic, strong) NSString * pwd;
// 运营商标识(1、电信 2、联通 3、移动)
@property (nonatomic, strong) NSString * providerSign;

@property (nonatomic, strong) NSString * selfTag;
//selfTag	自建系统标志

@property (nonatomic, strong) NSString * last_logInID;

@property (nonatomic, strong) NSString * now_logInID;
//广告版本号
@property (nonatomic, strong)NSString * versionsId_last;

//个人专区
@property (nonatomic, strong)NSString * userId_last;

@property (nonatomic, strong)NSString * userId_now;
 
*/


+ (MVNOUser *)currentUser;
- (void)loginOut;//注销
/*
 保存用户密码（加密后）以及获取（解密后）
 */
-(NSString *)getPwd;
- (void)savePwd:(NSString *)pwd;
/*
 保存用户名（加密后）以及获取（解密后）
 */
-(NSString *)getUserName;
- (void)saveUserName:(NSString *)userName;
/*
 保存自建系统标志 以及获取：0自建系统 1电信老用户
 */
- (void)saveSelfTag:(NSString *)selfTag;
-(NSString *)getSelfTag;

/*
 保存电话号码以及获取
 */
- (void)saveTelPhone:(NSString *)telPhone;
-(NSString *)getTelPhone;
/*
 保存运营商标示以及获取：(0联通 1电信 2移动)
 */
- (void)saveProviderSign:(NSString *)providerSign;
-(NSString *)getProviderSign;
/*
 保存自动登录标示以及获取
 */
- (void)saveIsAutoLogin:(BOOL)isAutoLogin;
-(BOOL)isAutoLogin;
/*
 保存最后一次登录ID以及获取
 */
-(void)saveLast_logInID:(NSString *)last_logInID;
-(NSString *)getLast_logInID;
/*
 保存当次登录ID以及获取
 */
-(void)saveNow_logInID:(NSString *)now_logInID;
-(NSString *)getNow_logInID;

-(void)saveVersionsId_last:(NSString *)versionsId_last;
-(NSString *)getVersionsId_last;

-(void)saveUserId_last:(NSString *)userId_last;
-(NSString *)getUserId_last;

-(void)saveUserId_now:(NSString *)userId_now;
-(NSString *)getUserId_now;
/*
 保存是否登录标示以及获取
 */
- (void)saveIsLogined:(BOOL)isLogined;
-(BOOL)isLogined;
/*
 保存是否欠费标示以及获取
 */
- (void)saveIsArrears:(BOOL)isArrears;
-(BOOL)isArrears;

/*
 保存是否是初始密码标识
*/
-(void)savePwdInitFlag:(NSString *)isInit;
-(NSString *)isPwdInitFlag;

/*
 保存是否是主号码标识
 */
-(void)saveMainTelFlag:(NSString *)isMain;
-(NSString *)isMainTelFlag;

/*
 保存是否注销账号,退出账号
 */
- (void)saveIsLoginOut:(BOOL)isLoginOut;
-(BOOL)isLoginOut;

@end
