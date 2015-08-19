//
//  NumberConstants.h
//  Reader
//
//  Created by lisz on 9/4/12.
//  Copyright (c) 2012 Asia. All rights reserved.
//
//常量数字
#define TABBAR_RECT CGRectMake(0, self.view.bounds.size.height - 49, 320, 49)
//首页标题的大小
#define INDEX_TITLE 14
//首页漫画小图片的标题大小
#define INDEX_THUMB_TITLE 10

#define NORMAL_TEXT_SIZE 16.0f

#define DEEP_TEXT_COLOR RGBCOLOR(62, 62, 62)

//首页每行的漫画数量
#define INDEX_CARTOON_NUM 10

//网络请求的超时时间
#define HTTP_TIMEOUT_SEC 15

//几个常用的高度
#define DEVICE_STATE_ROW_HEIGHT 20  //设备状态栏高度
#define NAVIGATIONBAR_HEIGH 44      //navigationbar导航条的高度
#define TABBAR_HEIGHT 49            //tabbar下角的高度

//图片下载的状态
typedef enum {
    StatesNormal,
    StatesDownloading,
    StatesDownloadFinished,
    StatesDownloadFailed
}ImageDownloadStates;

//漫画下载的状态
typedef enum {
    CartoonNormal,//没有下载
    CartoonPause,//暂停下载
    CartoonLoading,//下载中
    CartoonWaiting,//等待中
    CartoonDone,//下载完成
    CartoonFailed //下载失败
}CartoonLoadStates;

//RankCell的类型
typedef enum{
    RANK_CELL_TYPE = 0,             //排名的cell
    CLASS_CELL_TYPE ,            //分类的cell
    CLASS_DEL_CELL_TYPE,        //分类详细也排行
    SEARCH_CELL_TYPE            //搜索中的cell
}CELL_TYPE;

//分类页面四种类型
typedef enum{
    CONTENT_TYPE,            //内容
    CODE_TYPE,               //字母
    AREA_TYPE,               //地区
    STATE_TYPE,              //状态
}MENU_TYPE;                 //分类类型

//登录的类型
typedef enum {
    LoginTencent = 1,//腾讯登录
    LoginRenRen,//人人登录
    LoginSina,//sina登录
    LoginMogu //蘑菇派登录
}LoginType;

////漫画类型
typedef enum:int {
    CartoonOfExclusive, //独家漫画
    CartoonOfNet,
    CartoonOfMini       //微漫
}CartoonType;



typedef enum:int {
    CaricatureOneDayNew,//今日最新
    CaricatureOneDayFavorite,//今日最热
    CaricatureOneWeekFavorite//一周最re
}CaricatureChooseType;

typedef enum{
    BOOKSHELF_INIT_TYPE = 0,            //书架收藏
    HISTORY_INIT_TYPE = 1,              //阅读历史进入
    ELSE_INIT_TYPE = 2,                 //其他地方点击进入
}FROM_TYPE;

//漫画之间的图片距离
#define PAGE_GAP 20.0

//分类子页面类型
typedef enum {
    SORT_TYPE = 1,      //排序
    FITTER_TYPE     //筛选
}SubClassType;

//分类子页面排序种类
typedef enum : int {
    LASTEST_TYPE = 1,   //最新
    HOTTEST_TYPE,   //最热
    SCORENET_TYPE      //评分
}SortType;

//分类子页面筛选种类
typedef enum : int{
    DEFAULT_TYPE = 0,   //默认无筛选
    MAINLAND_TYPE = 1,  //大陆
    JANKOREA_TYPE,  //日韩
    EUROPE_TYPE,    //欧美
    HONGKONG_TYPE   //港台
}FitterType;

//=============微漫画相关============

//微漫画首页button点击，弹出视图
typedef enum {
    MINI_DOWNLOAD_TYPE = 0,     //下载按钮
    MINI_ORDER_TYPE         //排序按钮
}MiniPopType;

//筛选类型
typedef enum {
    MINI_TODAY_HOT = 1,
    MINI_WEEK_HOT = 2,
    MINI_TODAY_LASTEST = 3,
}OrderType;

//微漫画下载按钮点击
typedef enum {
    DEFAULT_NONE_TYPE = 0,   //默认无选择
    DOWNLOAD_TYPE = 1,  //开始下载
    CACHE_TYPE          //查看离线
}DownloadOrCache;

//显示详细的章节是，标记是下载还是浏览
typedef enum :int {
    ChapterWithScan, //浏览
    ChapterWithDownload
}ChapterShowType;

//微漫浏览tableView视图的位置
typedef enum {
    LEFT_VIEW = 0,
    MID_VIEW,
    RIGHT_VIEW
}LocationView;

//标志并判断是否显示评分星级（评论列表）
typedef enum {
    CartoonDetail_Type,
    MoreComment_Type,
    MiniCartoon_Type
}CommentType;


//设备状态栏 是 20pix
//导航条       44pix
//下脚tabbar   49pix
//分类页四个按钮42pix