//
//  MVNOUser.m
//  MVNO
//
//  Created by lisz5 on 14-3-14.
//  Copyright (c) 2014年 lishaozhou. All rights reserved.
//

#import "MVNOUser.h"

@implementation MVNOUser
static MVNOUser *currentUser = nil;



- (void)dealloc
{
//    RELEASE_SAFELY(_userName);
//    RELEASE_SAFELY(_pwd);
//    RELEASE_SAFELY(_providerSign)
//    RELEASE_SAFELY(_last_logInID)
//    RELEASE_SAFELY(_now_logInID)
//    RELEASE_SAFELY(_telPhone)
//    RELEASE_SAFELY(_versionsId_last)
//    RELEASE_SAFELY(_userId_last)
//    RELEASE_SAFELY(_userId_now)
    [super dealloc];
}



+ (MVNOUser *)currentUser
{
    @synchronized(self) {
        if (currentUser == nil) {
            currentUser = [[self alloc] init];
        }
    }
    
    return currentUser;
}

- (void)loginOut;//注销
{
    /*
    [self saveUserName:@""];
    [self saveTelPhone:@""];
    [self savePwd:@""];
    [self saveProviderSign:@""];
    [self saveLast_logInID:@""];
    [self saveNow_logInID:@""];
    [self saveVersionsId_last:@""];
    [self saveUserId_now:@""];
    [self saveUserId_last:@""];

    [self saveIsLogined:NO];
    [self saveIsArrears:NO];
    [self saveIsAutoLogin:NO];
    
    */
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
//    [self saveUserName:@""];
    [self saveTelPhone:@""];
    [self savePwd:@""];
    [self saveProviderSign:@""];
    [self saveLast_logInID:@""];
    [self saveNow_logInID:@""];
    [self saveVersionsId_last:@""];
    [self saveUserId_now:@""];
    [self saveUserId_last:@""];
    
    [self saveIsLogined:NO];
    [self saveIsArrears:NO];
    [self saveIsAutoLogin:NO];
    
    
//    [userDefaults removeObjectForKey:login_USERNAME];
    [userDefaults removeObjectForKey:login_telPhone];
    [userDefaults removeObjectForKey:login_PASSWORD];
    [userDefaults removeObjectForKey:login_PROVIDERSIGN];
    [userDefaults removeObjectForKey:last_LOGINID];
    [userDefaults removeObjectForKey:now_LOGINID];
    [userDefaults removeObjectForKey:VERSION_LAST];
    [userDefaults removeObjectForKey:USER_ID_NOW];
    [userDefaults removeObjectForKey:USER_ID_LAST];
    [userDefaults removeObjectForKey:IsLogined];
    [userDefaults removeObjectForKey:IsArrears];
    [userDefaults removeObjectForKey:login_Auto];
    [userDefaults removeObjectForKey:IsMainTel];
    [userDefaults removeObjectForKey:IsPwdInit];

    NSLog(@"loginOut ## pwd = %@",[self getPwd]);
    NSLog(@"loginOut ## tel = %@",[self getUserName]);
    NSLog(@"loginOut ## login = %d",[self isLogined]);


}


- (void)savePwd:(NSString *)pwd{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_PASSWORD];
    NSString *tempPwd = [Tools TripleDES:pwd encryptOrDecrypt:kCCEncrypt];
    [userDefaults setObject:tempPwd forKey:login_PASSWORD];
    
    [userDefaults synchronize];
}

-(NSString *)getPwd{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * pwd = [userDefaults objectForKey:login_PASSWORD];
    pwd = [Tools TripleDES:pwd encryptOrDecrypt:kCCDecrypt];
    return pwd;
}

- (void)saveUserName:(NSString *)userName{

    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_USERNAME];
    NSString *tempUserName = [Tools TripleDES:userName encryptOrDecrypt:kCCEncrypt];
    [userDefaults setValue:tempUserName forKey:login_USERNAME];
    [userDefaults synchronize];
    
}

-(NSString *)getUserName{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userName = [userDefaults objectForKey:login_USERNAME];
    userName = [Tools TripleDES:userName encryptOrDecrypt:kCCDecrypt];
    return userName;
    
}

- (void)saveSelfTag:(NSString *)selfTag{

    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_SELFTAG];
    [userDefaults setObject:selfTag forKey:login_SELFTAG];
    [userDefaults synchronize];
}

-(NSString *)getSelfTag{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * selfTag = [userDefaults objectForKey:login_SELFTAG];

    return selfTag;
    
}

- (void)saveTelPhone:(NSString *)telPhone
{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_telPhone];
    [userDefaults setObject:telPhone forKey:login_telPhone];
    [userDefaults synchronize];
}

-(NSString *)getTelPhone{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * tel = [userDefaults objectForKey:login_telPhone];
    
    return tel;
    
}

- (void)saveProviderSign:(NSString *)providerSign{

    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_PROVIDERSIGN];
    [userDefaults setObject:providerSign forKey:login_PROVIDERSIGN];
    [userDefaults synchronize];
}

-(NSString *)getProviderSign{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * providerSign = [userDefaults objectForKey:login_PROVIDERSIGN];
    
    return providerSign;
    
}

- (void)saveIsAutoLogin:(BOOL)isAutoLogin{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:login_Auto];
    [userDefaults setBool:isAutoLogin forKey:login_Auto];
    [userDefaults synchronize];
    
}

-(BOOL)isAutoLogin{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL AutoLogin = [userDefaults boolForKey:login_Auto];
    
    return AutoLogin;
    
}

-(void)saveLast_logInID:(NSString *)last_logInID
{

    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:last_LOGINID];
    [userDefaults setObject:last_logInID forKey:last_LOGINID];
    [userDefaults synchronize];
}

-(NSString *)getLast_logInID{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * last_logInID = [userDefaults objectForKey:last_LOGINID];
    
    return last_logInID;
    
}

-(void)saveNow_logInID:(NSString *)now_logInID{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:now_LOGINID];
    [userDefaults setObject:now_logInID forKey:now_LOGINID];
    [userDefaults synchronize];
}

-(NSString *)getNow_logInID{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * now_logInID = [userDefaults objectForKey:now_LOGINID];
    
    return now_logInID;
    
}

-(void)saveVersionsId_last:(NSString *)versionsId_last
{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:VERSION_LAST];
    [userDefaults setObject:versionsId_last forKey:VERSION_LAST];
    [userDefaults synchronize];
}

-(NSString *)getVersionsId_last{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * versionsId_last = [userDefaults objectForKey:VERSION_LAST];
    
    return versionsId_last;
    
}

-(void)saveUserId_last:(NSString *)userId_last
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:USER_ID_LAST];
    [userDefaults setObject:userId_last forKey:USER_ID_LAST];
    [userDefaults synchronize];
    
}

-(NSString *)getUserId_last{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userId_last = [userDefaults objectForKey:USER_ID_LAST];
    
    return userId_last;
    
}

-(void)saveUserId_now:(NSString *)userId_now
{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:USER_ID_NOW];
    [userDefaults setObject:userId_now forKey:USER_ID_NOW];
    [userDefaults synchronize];
}

-(NSString *)getUserId_now{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userId_now = [userDefaults objectForKey:USER_ID_NOW];
    
    return userId_now;
    
}

- (void)saveIsLogined:(BOOL)isLogined{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:IsLogined];
    [userDefaults setBool:isLogined forKey:IsLogined];
    [userDefaults synchronize];
    
}

-(BOOL)isLogined{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL Logined = [userDefaults boolForKey:IsLogined];
    
    return Logined;
    
}

- (void)saveIsArrears:(BOOL)isArrears{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:IsArrears];
    [userDefaults setBool:isArrears forKey:IsArrears];
    [userDefaults synchronize];
    
}

-(BOOL)isArrears{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL Arrears = [userDefaults boolForKey:IsArrears];
    return Arrears;
    
}

/*
 保存是否是初始密码标识
 
 #define IsPwdInit           @"IsPwdInit"
 #define IsMainTel           @"IsMainTel"
 */
-(void)savePwdInitFlag:(NSString *)isInit{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:IsPwdInit];
    [userDefaults setObject:isInit forKey:IsPwdInit];
    [userDefaults synchronize];

}
-(NSString *)isPwdInitFlag{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString  *isPwnInit = [userDefaults stringForKey:IsPwdInit];
    return isPwnInit;
    
}

/*
 保存是否是主号码标识
 */
-(void)saveMainTelFlag:(NSString *)isMain{
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:IsMainTel];
    [userDefaults setObject:isMain forKey:IsMainTel];

    [userDefaults synchronize];
    
}
-(NSString *)isMainTelFlag{
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *isMainTel = [userDefaults stringForKey:IsMainTel];
    return isMainTel;
    
}


@end
