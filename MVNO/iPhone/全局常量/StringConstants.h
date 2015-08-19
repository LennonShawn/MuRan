//
//  StringConstants.h
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//

// 服务器地址
// http://10.1.64.125:8080      // 籽良
// http://pkgcrmhbhmvno1:14211   // 国美测试


//#define VERSION1 @"version1"

// TEST
//http://10.1.38.105:8080/mvno-mapp/
//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.38.168:8080"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/mvno-mapp//",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://10.1.38.168:8080"]

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.38.129:8080"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MAPP",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://10.1.38.129:8080"]

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.38.105:8080"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/mvno-mapp",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://10.1.38.105:8080"]

// 公司内网
//http://124.207.3.10:28022/MVNO-HBH
//http://10.1.249.32:34211/MVNO-HBH/


//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.249.32:34211"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-HBH",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://10.1.249.32:34211"]


// 国美300内

// #define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.128.11.110:14131"]
// #define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-CRM-HBH",MAPP_SERVER_ADDRESSINIT]
// #define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://10.128.11.110:14131"]



// 国美300外

// #define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://119.254.77.24:10010"]
// #define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-CRM-HBH",MAPP_SERVER_ADDRESSINIT]
// #define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://119.254.77.24:10010"]

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://119.254.77.24:14131"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-CRM-HBH",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://119.254.77.24:14131"]

// 国美 500 外 //http://119.254.77.24:24131/MVNO-CRM-HBH

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://119.254.77.24:24131"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-CRM-HBH",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://119.254.77.24:24121/MVNO-CRM-OBH"]

// 国美生产环境 800外

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://119.254.77.26:19210"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-CRM-HBH",MAPP_SERVER_ADDRESSINIT]
//#define MAPP_SERVER_ADDRESSINITWT [NSString stringWithFormat:@"http://www.g-mobile.com.cn"]

//内网测试

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.54.154:8080"]//lj
//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.54.37:8080"]//zxf
//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://10.1.54.167:8080"]//sp
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/mvno-mapp-hx",MAPP_SERVER_ADDRESSINIT]

//测试环境

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://223.202.119.155:14211"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-HBH",MAPP_SERVER_ADDRESSINIT]


//准现网测试，集成

#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://223.202.119.155:34481"]
#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-WX",MAPP_SERVER_ADDRESSINIT]


//现网测试

//#define MAPP_SERVER_ADDRESSINIT [NSString stringWithFormat:@"http://223.202.102.28:80"]
//#define MAPP_SERVER_ADDRESS [NSString stringWithFormat:@"%@/MVNO-WX",MAPP_SERVER_ADDRESSINIT]


// mvno-mapp-1.0 mvno-mapp
//weather url
#define WEATHER_URL @"http://weather.yahooapis.com/forecastrss?w=%@&u=c"
//请求登录对哪些平台开放
#define Login_SERVER_ADDRESS [NSString stringWithFormat:@"http://mogu.reader.app.mogupai.com/api/sns_platform_open.php?version=%@&platform=iphone",[Tools urlWithVersion]]//
//
#define BOOK_LABEL_ADDRESS [NSString stringWithFormat:@"http://mogu.reader.app.mogupai.com/api/?"]//


//放到什么平台
//#define RELEASE_VERSION @"91"    //放到91
#define RELEASE_VERSION @"app_store" //放到appStore
//服务器请求参数(Parameter)
#define P_ACTION @"action"
#define P_TASK @"task"


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (fabs((double)[[ UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



//数据库的存储路径
#define STOREPATH [NSHomeDirectory() stringByAppendingString:@"/Documents/read.sqlite"]
#define IS_FIRST_USE_DATABACE @"IS_FIRST_USE_DATABACE"

//存放图片和漫画的路径
//#define PATH_TO_STORE_IMAGE [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"ImageCache"]
#define PATH_TO_STORE_IMAGE [[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]
#define PATH_FINAL_TO_STORE_CARTOON [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"Cartoons"]

#define PATH_TEMP_TO_STORE_CARTOON [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"tmp_Cartoons"]
//#define PATH_ONLINEREAD_TEMP [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"Online_Cartoons"]
#define PATH_BOOKSHELF_BOOKIMAGE [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"bookshelfImage"]                   //书架,详情书的封面
#define PATH_AllChapter_FILE [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"allChapterFile"]                   //所以章节的存储位置

#define PATH_FINAL_TO_MINI_CARTOON [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"mini_Cartoons"]//微漫存储位置
#define PATH_FINAL_TO_TEMP_MINI_CARTOON [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library"] stringByAppendingPathComponent:@"Caches"]stringByAppendingPathComponent:@"tempMini_Cartoons"]//微漫缓存存储位置

//APP KEY 
#define TENCENT_APP_KEY @"100312524"
#define TENCENT_APP_SECKRET @"272b2ad2ec01751cf39d827a573c0bb1"

//Umeng APP key
#define useAppkey @"507247455270154aea0000bf"

//UMSAgent key
#define umSAgentKey @"8f34efc32ea617a012ef967b99f93a95"

//人人网的APP Key
#define kAPP_ID     @"202467"
#define kAPI_Key    @"90213bf1fcb8477bae42bd8592e904e5"
#define RenRen_APP_SECKRET @"eb0a8f4a4cc444f28a023689d732fe58"

//sina
#define sina_ID @"2757906453"
#define sina_secret @"21b6b9654c072ce26c2cb43c42d662c8"

//通知时下载的选择框（出现）
#define DOWNLOAD_CARTOON_BOX_APPEAR @"DOWNLOAD_CARTOON_BOX_APPEAR"
//通知时下载的选择框（消失）
#define DOWNLOAD_CARTOON_BOX_DISAPPEAR @"DOWNLOAD_CARTOON_BOX_DISAPPEAR"
//通知时下载的选择框（全选）
#define DOWNLOAD_CARTOON_SELECTED_ALL @"DOWNLOAD_CARTOON_SELECTED_ALL"
//通知时下载的选择框（反选）
#define DOWNLOAD_CARTOON_BOX_SELECTED_INVERSE @"DOWNLOAD_CARTOON_BOX_SELECTED_INVERSE"
//通知开始下载
#define DOWNLOAD_CARTOON_BEGIN @"DOWNLOAD_CARTOON_BEGIN"
//通知下载完成
#define DOWNLOAD_CARTOON_DONE @"DOWNLOAD_CARTOON_DONE"
//删除一条下载
#define DOWNLOAD_CARTOON_DELETE @"DOWNLOAD_CARTOON_DELETE"
//网络漫画下载一张图片成功
#define DOWNLOAD_NET_CARTOON_DONE @"DOWNLOAD_NET_CARTOON_DONE"

//下载管理页面
//通知时下载的选择框（出现）
#define DOWNLOAD_CARTOON_BOX_APPEAR_MANAGE @"DOWNLOAD_CARTOON_BOX_APPEAR_MANAGE"
//通知时下载的选择框（消失）
#define DOWNLOAD_CARTOON_BOX_DISAPPEAR_MANAGE @"DOWNLOAD_CARTOON_BOX_DISAPPEAR_MANAGE"
//通知时下载的选择框（全选）
#define DOWNLOAD_CARTOON_SELECTED_ALL_MANAGE @"DOWNLOAD_CARTOON_SELECTED_ALL_MANAGE"
//通知时下载的选择框（反选）
#define DOWNLOAD_CARTOON_BOX_SELECTED_INVERSE_MANAGE @"DOWNLOAD_CARTOON_BOX_SELECTED_INVERSE_MANAGE"

//保存的本地的漫画下载信息的KEY
#define LOCAL_CARTOON_DOWNLOAD_INFO @"LOCAL_CARTOON_DOWNLOAD_INFO"
//保存的本地的漫画阅读的KEY
#define LOCAL_CARTOON_HISTORY_INFO @"LOCAL_CARTOON_HISTORY_INFO"

//管理页面
#define DOWNLOAD_CARTOON_LIST_DOWNLOADING @"DOWNLOAD_CARTOON_LIST_DOWNLOADING"
#define DOWNLOAD_CARTOON_LIST_DONE @"DOWNLOAD_CARTOON_LIST_DONE"

//点击人人登录的时候返回主页面
#define RENREN_BACK_ACTION @"RENREN_BACK_ACTION"

//通知进入详情页
#define NOTIFICATION_JUMP_DETAIL @"NOTIFICATION_JUMP_DETAIL"

//书架，我的收藏移除书的通知
#define REMOVE_BOOK_BOOKSHELF @"REMOVE_BOOK_BOOKSHELF"
//添加书到收藏书架
#define ADDBOOK_TO_FAVORITESHELF @"ADDBOOK_TO_FAVORITESHELF"
//添加到历史的通知
#define ADDBOOK_TO_HISTORYSHELF @"ADDBOOK_TO_HISTORYSHELF"

//存放在本地的登录信息
#define LOCAL_LOGIN_INFO @"LOCAL_LOGIN_INFO"

//首次登录返回的用户昵称
#define FIRST_LOCAL_NICKNAME @"FIRST_LOCAL_NICKNAME"

//如果网络链接失败，则加载上次的用户
#define LAST_LOCAL_NICKNAME @"LAST_LOCAL_NICKNAME"
#define LAST_LOCAL_POINT @"LAST_LOCAL_POINT"
#define LAST_LOCAL_SESSIONKEY @"LAST_LOCAL_SESSIONKEY"
#define LAST_LOCAL_HEADURL @"LAST_LOCAL_HEADURL"

//充值成功，更新一下用户积分
#define UPDATE_USER_POINTS @"UPDATE_USER_POINTS"
//当请求到的用户积分为“session_id非法”时，说明用户的账号在另一台机器上登录
#define UPDATE_USER_WRONG_POINTS @"session_id非法"
//下面的两个宏定义表示从服务器下载的提示用户账户异常和提示用户为什么要进行账户绑定
#define USER_ACCOUNT_EXCEPTION @"USER_ACCOUNT_EXCEPTION"
#define PROMPT_USER_BINDING @"PROMPT_USER_BINDING"

#define CARIPAGELIMIT 18//每页显示的微漫的数量
//存储搜藏漫画
#define LOCAL_CARTOON_FAVORITE_INFO @"LOCAL_CARTOON_FAVORITE_INFO"

#define CARICATURE_DOWLOAD_KEY @"CARICATURE_DOWLOAD_KEY" //保存下载的微漫数据
#define DismissVerifyVCNotification  @"DismissVerifyVCNotification"

#define SDWIRetain(__v) ([__v retain]);
#define SDWIReturnRetained SDWIRetain
