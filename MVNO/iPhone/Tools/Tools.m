//
//  Tools.m
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

#import "Tools.h"
#import <CommonCrypto/CommonDigest.h>
#import "StringConstants.h"
#import "CJSONDeserializer.h"
#import "NSData+Base64.h"
#import "JSON.h"
#import "Reachability.h"
#import "MVNOUser.h"
//#include <arpa/inet.h>
//#include <netdb.h>
//#include <net/if.h>
//#include <ifaddrs.h>
//#import <dlfcn.h>
//#import <SystemConfiguration/SystemConfiguration.h>

@implementation Tools

+ (void)showSpinnerInView:(UIView *)view prompt:(NSString *)prompt
{
    if (view != nil) {
        [MBProgressHUD hideAllHUDsForView:view animated:NO];
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
        HUD.removeFromSuperViewOnHide = YES;
        if (prompt.length > 0) {
            HUD.mode = MBProgressHUDModeIndeterminate;
            HUD.labelText = prompt;
        }
    }
}
+ (void)hideSpinnerInView:(UIView *)view
{
    if (view != nil) {
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
    }
}
+(void)reSetLogId
{
//    [[MVNOUser currentUser] setLast_logInID:[MVNOUser currentUser].now_logInID];
    [[MVNOUser currentUser] saveLast_logInID:[[MVNOUser currentUser] getNow_logInID]];
//    [[MVNOUser currentUser] setNow_logInID:[NSString stringWithFormat:@"%d",[Tools getRandomNumber:0 to:10000]]];
    [[MVNOUser currentUser] saveNow_logInID:[NSString stringWithFormat:@"%d",[Tools getRandomNumber:0 to:10000]]];
}
+(void)reSetUserId
{

   
    [[MVNOUser currentUser] saveUserId_last: [[MVNOUser currentUser] getUserId_now]];

     [[MVNOUser currentUser] saveUserId_now:[NSString stringWithFormat:@"%d",[Tools getRandomNumber:0 to:10000]]];
    
    NSLog(@"*****%@,%@",[[MVNOUser currentUser] getUserId_last],[[MVNOUser currentUser] getUserId_now]);
}
+(void)setUserIdEqual
{

//    [[MVNOUser currentUser] setUserId_last:[MVNOUser currentUser].userId_now];
    [[MVNOUser currentUser] saveUserId_last:[[MVNOUser currentUser] getUserId_now]];
//   NSLog(@"&&&&%@,%@",[MVNOUser currentUser].userId_last,[MVNOUser currentUser].userId_now);
    NSLog(@"&&&&%@,%@",[[MVNOUser currentUser] getUserId_last],[[MVNOUser currentUser] getUserId_now]);
}
+ (void)showPrompt:(NSString *)prompt inView:(UIView *)view delay:(NSTimeInterval)delay
{
    if (view != nil) {
        [MBProgressHUD hideAllHUDsForView:view animated:NO];
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
        HUD.removeFromSuperViewOnHide = YES;
        if (prompt.length > 0) {
            HUD.mode = MBProgressHUDModeText;
            HUD.labelText = prompt;
        }
        [HUD hide:YES afterDelay:delay];
    }
}
//获取随机数
+(int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to - from + 1)));
    
}
+ (UIImage *)imageWithName:(NSString *)name
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:NSLocalizedString(name,@"适配") ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    if (!image) {
        
    }
    return [image autorelease];
}

+ (UILabel *)createLabel:(NSString *)content color:(UIColor *)color font:(UIFont *)font
{
    CGSize size = [content sizeWithFont:font];
    return [self createLabel:content frame:CGRectMake(0, 0, (int)size.width, (int)size.height) color:color font:font aliment:NSTextAlignmentCenter];
}

+ (UILabel *)createLabel:(NSString *)content frame:(CGRect)frame color:(UIColor *)color font:(UIFont *)font aliment:(NSTextAlignment)aliment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.text = content;
    label.textColor = color;
    label.font = font;
    label.textAlignment = aliment;
    return [label autorelease];
}


+ (UIButton *)createButtonWithText:(NSString *)text
                                   target:(id)target
                                   action:(SEL)action
{
    
    UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 60, 32);
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateSelected];
    return [button autorelease];
    
}

+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                           highlitedImage:(NSString *)highlited
                                   target:(id)target 
                                   action:(SEL)action
{
    
    UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    UIImage *normalImage = [self imageWithName:normal];
    UIImage *highlightImage = [self imageWithName:highlited];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    return [button autorelease];
    
}

+ (UIButton *)createButtonWithNormalImage:(NSString *)normal
                            selectedImage:(NSString *)highlited
                                   target:(id)target 
                                   action:(SEL)action
{
    UIButton *button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    UIImage *normalImage = [self imageWithName:normal];
    UIImage *selectedImage = [self imageWithName:highlited];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateHighlighted];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    return [button autorelease];
}

//创建navbar
+ (UIBarButtonItem *)createNavButtonItem:(NSString *)normal
                                selected:(NSString *)selected
                                  target:(id)taget
                                  action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImg = [self imageWithName:normal];
    UIImage *selectedImg = [self imageWithName:selected];
    CGSize size = normalImg.size;
    button.frame = CGRectMake(0, 0, size.width, size.height);
    [button setImage:normalImg forState:UIControlStateNormal];
    [button setImage:selectedImg forState:UIControlStateHighlighted];
    [button addTarget:taget action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return [item autorelease];
}

//创建navbar
+ (UIBarButtonItem *)createNavButtonItem:(NSString *)normal
                                  target:(id)taget
                                  action:(SEL)action
{
    UIView * rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    rightView.backgroundColor = [UIColor clearColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.showsTouchWhenHighlighted = YES;
    UIImage *normalImg = [self imageWithName:normal];
    CGSize size = normalImg.size;
    button.frame = CGRectMake(0, 0, size.width, size.height);
    [button setImage:normalImg forState:UIControlStateNormal];
    [button addTarget:taget action:action forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:button];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    [rightView release];
    return [item autorelease];
}

// 定制Slider
+ (UISlider *)createSliderViewWithFrame:(CGRect)frame andMaxiImage:(NSString *)maxiImageStr  andMiniImage:(NSString *)miniImageStr  andThumbImage:(NSString *)thumbImageStr andTarget:(id)taget andAction:(SEL)action{
    
    UIImage * maxImage = [[UIImage imageNamed:miniImageStr ]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0) ];
    UIImage * minImage = [[UIImage imageNamed:maxiImageStr ]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage * thumbImage = [[UIImage imageNamed:thumbImageStr ]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UISlider * slider = [[UISlider alloc]initWithFrame:frame];
    
    /*
     [[UISlider appearance] setMaximumTrackImage:maxImage
     forState:UIControlStateNormal];
     [[UISlider appearance] setMinimumTrackImage:minImage
     forState:UIControlStateNormal];
     [[UISlider appearance] setThumbImage:thumbImage
     forState:UIControlStateNormal];
     */
    
    
    [slider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [slider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [slider setThumbImage:thumbImage forState:UIControlStateNormal];
    
    [slider addTarget:taget action:action forControlEvents:UIControlEventValueChanged];
    
    return [slider autorelease];
}



+ (NSString *)cachePathForKey:(NSString *)key
{
    const char *str = [key UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    
    return [PATH_TO_STORE_IMAGE stringByAppendingPathComponent:filename];
}

+ (UIImage *)isExitInLocal:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        return image;
    }
    else {
        return nil;
    }
}

//+ (NSString *) hostname 
//{
//	char baseHostName[256]; // Thanks, Gunnar Larisch
//	int success = gethostname(baseHostName, 255);
//	if (success != 0) {
//        return nil;
//    }
//	baseHostName[255] = '\0';
//	
//#if !TARGET_IPHONE_SIMULATOR
//	return [NSString stringWithFormat:@"%s.local", baseHostName];
//#else
// 	return [NSString stringWithFormat:@"%s", baseHostName];
//#endif
//}
//
//+ (NSString *) localIPAddress {
//	struct hostent *host = gethostbyname([[self hostname] UTF8String]);
//    if (!host) {
//        herror("resolv"); 
//        return nil;
//    }
//    struct in_addr **list = (struct in_addr **)host->h_addr_list;
//	return [NSString stringWithCString:inet_ntoa(*list[0]) encoding:NSUTF8StringEncoding];
//}
//
//+ (NSString *)localWiFiIPAddress 
//{
//	BOOL success;
//	struct ifaddrs * addrs;
//	const struct ifaddrs * cursor;
//
//	success = getifaddrs(&addrs) == 0;
//	if (success) {
//		cursor = addrs;
//		while (cursor != NULL) {
//			// the second test keeps from picking up the loopback address
//			if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0) 
//			{
//				NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
//				if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
//					return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
//			}
//			cursor = cursor->ifa_next;
//		}
//		freeifaddrs(addrs);
//	}
//	return nil;
//}
//
//+ (NSString *)whatismyipdotcom 
//{
//	NSError *error;
//    NSURL *ipURL = [NSURL URLWithString:@"http://www.whatismyip.com/automation/n09230945.asp"];
//    //NSURL *ipURL = [NSURL URLWithString:@"http://www.whatismyip.com/faq/automation.asp"];
//    NSString *ip = [NSString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
//	return ip ? ip : [error localizedDescription];
//}

+ (NSString *)urlWithVersion
{
    return [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]]
    ;
}

+ (void)saveLoginInfo:(NSArray *)infos
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:infos] forKey:LOCAL_LOGIN_INFO];
    [defaults synchronize];
}
+ (NSArray *)getLocalLoginInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:LOCAL_LOGIN_INFO];
    NSArray *array = [[NSArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:data]]; 
    NSLog(@"本地登录的个数是：%lu",(unsigned long)[array count]);
    return [array autorelease];
}

//适配方法
+ (float)getCurrentDistinction
{
    if (IS_IPHONE_5) {
        return (548 - 460);
    }
    else
    {
        return 0;
    }
}

//获取mac地址
+ (NSString *)macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

//判断是否越狱
+ (BOOL)isJailbroken
{
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        return YES;
    }
   else if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
       return YES;
    }
    return NO;
}

+ (BOOL)putStringToItunes:(NSData*)iapData
{
    NSString*encodingStr = [iapData base64EncodedString];
    NSString *URL=@"https://sandbox.itunes.apple.com/verifyReceipt";
    //https://buy.itunes.apple.com/verifyReceipt
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];// autorelease];
    [request setURL:[NSURL URLWithString:URL]];
    [request setHTTPMethod:@"POST"];
    //设置contentType
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[encodingStr length]] forHTTPHeaderField:@"Content-Length"];
    
    NSDictionary* body = [NSDictionary dictionaryWithObjectsAndKeys:encodingStr, @"receipt-data", nil];
    SBJsonWriter *writer = [[[SBJsonWriter alloc] init] autorelease];
    [request setHTTPBody:[[writer stringWithObject:body] dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    NSHTTPURLResponse *urlResponse=nil;
    NSError *errorr=nil;
    NSData *receivedData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&urlResponse
                                                             error:&errorr];
    
    //解析
    NSString *results=[[[NSString alloc]initWithBytes:[receivedData bytes] length:[receivedData length] encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"-Himi-  %@",results);
    NSDictionary *dic = [results JSONValue];
    NSLog(@"-Himi- Dic =   %@",dic);
    [request release];
    if([[dic objectForKey:@"status"] intValue] == 0){//注意，status=@"0" 是验证收据成功
        return YES;
    }
    return NO;
}

// 判断网络是否可用
+ (BOOL) checkNetworkIsValid {
	struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	
	SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;
    
	BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
	CFRelease(defaultRouteReachability);
	
	if (!didRetrieveFlags) {
		return NO;
	}
	
	BOOL isReachable = flags & kSCNetworkFlagsReachable;
	BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
	// = flags & kSCNetworkReachabilityFlagsIsWWAN;
	BOOL nonWifi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	BOOL moveNet = flags & kSCNetworkReachabilityFlagsIsWWAN;
	
	return ((isReachable && !needsConnection) || nonWifi || moveNet) ? YES : NO;
    
}


+ (NSString*)GetCurrntNet
{
 	NSString *connectionKind = nil;
    Reachability* hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
	switch ([hostReach currentReachabilityStatus]) {
		case NotReachable:
			connectionKind = @"null";
			break;
		case ReachableViaWiFi:
			connectionKind = @"wifi";
			break;
		case ReachableViaWWAN:
			connectionKind = @"3g";
			break;
		default:
			break;
    }
    return connectionKind;
}


+(long)fileSizeForDir:(NSString *)path
{
    long size = 0;
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSLog(@"path === %@ ===",path);
    NSArray* array = [fileManager contentsOfDirectoryAtPath:path error:nil];
    if ([array count] > 0) {
        for(int i = 0; i<[array count]; i++)
        {
            NSString *fullPath = [path stringByAppendingPathComponent:[array objectAtIndex:i]];
            NSLog(@" ======== %@ =====",fullPath);
            BOOL isDir = NO;
            if (([fileManager fileExistsAtPath:fullPath isDirectory:&isDir] && isDir))
            {
                NSArray *array1 = [fileManager subpathsAtPath:fullPath];
                for (NSString *str in array1) {
                    NSString *fullPath1 = [fullPath stringByAppendingPathComponent:str];
                    NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath1 error:nil];
                    size += fileAttributeDic.fileSize;
                }
                
            }
            else {
                    NSDictionary *fileAttributeDic=[fileManager attributesOfItemAtPath:fullPath error:nil];
                    size += fileAttributeDic.fileSize;
            }
        }
    }

    [fileManager release];
    return size;

}

//统一controller的标题
+ (UILabel *)createTitleLabel:(NSString *)title
{
    UILabel *titleLable = [[Tools createLabel: NSLocalizedString(title, @"标题") frame:CGRectMake(0, 0, 200, 44) color:RGBCOLOR(62, 62, 62) font:[UIFont systemFontOfSize:20] aliment:NSTextAlignmentCenter] retain];
//    titleLable.shadowColor = [UIColor colorWithRed:202 / 255.0 green:81 / 255.0 blue:0 / 255.0 alpha:0.5];
//    titleLable.shadowOffset = CGSizeMake(0.0f, -1);
    if (title.length > 12) {
        titleLable.font = [UIFont systemFontOfSize:16];
        titleLable.numberOfLines = 2;
    }
    return [titleLable autorelease];
}


// 打电话功能
+ (BOOL) makeCall:(NSString *)phoneNumber
{
    if (phoneNumber==nil ||[phoneNumber isEqualToString:@""])
    {
        return NO;
    }
    BOOL call_ok = false;
    NSString * numberAfterClear = [phoneNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", numberAfterClear]];
    NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", numberAfterClear]];

    NSLog(@"make call, URL=%@", phoneNumberURL);
    
    call_ok = [[UIApplication sharedApplication] openURL:phoneNumberURL];
    
    return call_ok;
}

// 3DES 加解密

#define kChosenDigestLength     CC_SHA1_DIGEST_LENGTH
#define DESKEY @"4BD634432ERRDF432FFSDDSFAQSDF3E83A361FA75FA446933F90D384C6F6520F29FCD8EA"

+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt
{
    
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (encryptOrDecrypt == kCCDecrypt)//解密
    {
        NSData *EncryptData = [GTMBase64 decodeData:[plainText dataUsingEncoding:NSUTF8StringEncoding]];
        plainTextBufferSize = [EncryptData length];
        vplainText = [EncryptData bytes];
    }
    else //加密
    {
        NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [data length];
        vplainText = (const void *)[data bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    // memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    const void *vkey = (const void *)[DESKEY UTF8String];
    // NSString *initVec = @"init Vec";
    //const void *vinitVec = (const void *) [initVec UTF8String];
    //  Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    
    ccStatus = CCCrypt(encryptOrDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding | kCCOptionECBMode,
                       vkey,
                       kCCKeySize3DES,
                       nil,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    //if (ccStatus == kCCSuccess) NSLog(@"SUCCESS");
    /*else if (ccStatus == kCC ParamError) return @"PARAM ERROR";
     else if (ccStatus == kCCBufferTooSmall) return @"BUFFER TOO SMALL";
     else if (ccStatus == kCCMemoryFailure) return @"MEMORY FAILURE";
     else if (ccStatus == kCCAlignmentError) return @"ALIGNMENT";
     else if (ccStatus == kCCDecodeError) return @"DECODE ERROR";
     else if (ccStatus == kCCUnimplemented) return @"UNIMPLEMENTED"; */
    
    NSString *result;
    
    if (encryptOrDecrypt == kCCDecrypt)
    {
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                               length:(NSUInteger)movedBytes]
                                       encoding:NSUTF8StringEncoding];
        free(bufferPtr);
        return [result autorelease] ;

    }
    else
    {
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [GTMBase64 stringByEncodingData:myData];
        free(bufferPtr);
        return result;
    }
    //bufferPtr = NULL;
}


+ (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (NSString *)
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)input,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
    return outputStr;
}

+ (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/*手机号码验证 Add by lisz*/
+(BOOL) isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    // NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^1\\d{10}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:mobile];
}
+(NSString *)getCurrentTime
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
+(int)getTimeDifference:(NSString *)date_last
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date1 = [formatter dateFromString:date_last];
    NSDate * date2 = [NSDate date];
    NSTimeInterval interval = [date2 timeIntervalSinceDate:date1];
    
    int hour = (int)interval/3600;
    int minute = (int)(interval - hour/3600)/60;
    return minute;
}



@end
