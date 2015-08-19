//
//  WebViewVC.m
//  MVNO
//
//  Created by beautyx on 15-3-25.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "WebViewVC.h"

@interface WebViewVC ()

@property (nonatomic)NSInteger nLevel;


@end

@implementation WebViewVC

- (id)initMyWebViewControllerWithURL:(NSMutableURLRequest *)request Title:(NSString *)title{
    
    self = [super initAndHiddenTabBar:YES hiddenLeftButton:NO];
    [self.navigationItem setRightBarButtonItem:nil];
    
    if (self) {
        // Custom initialization
        _enableGoBack = NO;
        _nLevel = 0;
        self.request = request;
        self.title = title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavTitle:self.title];
    [self initWebView];
}

-(void)initWebView{

    if (!webView) {
        
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, self.view.frame.size.height)];
        webView.delegate = self;
        webView.scalesPageToFit = YES;
        webView.contentMode = UIViewContentModeScaleToFill;
        webView.multipleTouchEnabled = YES;
        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        webView.layer.opaque = NO;
        webView.backgroundColor = [UIColor clearColor];
        [self.view addSubview: webView];
    }


}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    [self loadWebViewInfo];
        
    
}

-(void)loadWebViewInfo{
    
    
    NSLog(@"%@",NSStringFromSelector(_cmd));

    
    if (![Tools checkNetworkIsValid]){
        
        [Tools showPrompt:@"网络请求超时，请稍候再试。" inView:self.view delay:1];
    } else {
        
        NSLog(@"开始请求");

        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [webView loadRequest:self.request];
        
    }
    
    
}

#pragma mark -

- (void)backButtonPressed:(id)sender{
    
    [webView stopLoading];
    NSLog(@"Levvel [1] %ld",(long)_nLevel);
    NSLog(@"_enableGoBack = %d",_enableGoBack);
    
    if (_nLevel >= 2 && _enableGoBack == YES) {
        [webView goBack];
        _nLevel-= 2;
    NSLog(@"Levvel [2] %d",_nLevel);
        
        if (_nLevel == 0 ) {
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//            [Tools hideSpinnerInView:self.view];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        return;
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UIWebView Delegate


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    sleep(1);
    [Tools showPrompt:@"网络请求超时，请稍候再试。" inView:self.view delay:1];
    _nLevel = 0;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    NSLog(@"正在加载");
    

}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"隐藏状态显示器");
//    [Tools hideSpinnerInView:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    _nLevel++;
    NSLog(@"完毕_nLevel = %d",_nLevel);
    
    
    NSLog(@"the URL = %@",self.request.URL);
    
//    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
//        NSLog(@"arrearsPay cookie＝ %@", cookie);
//    }
//    NSLog(@"cookies = %@",[cookieJar cookies]);
    
//    [self getCookie:@"hel"];
    [self cookieTouched];
    
}


//获取cookie
- (void)cookieTouched{
    NSURL *url = [NSURL URLWithString:@"http://www.douban.com/"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:3];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               
                               //转换NSURLResponse成为HTTPResponse
                               NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
                               //获取headerfields
                               NSDictionary *fields = [HTTPResponse allHeaderFields];//原生NSURLConnection写法
                               // NSDictionary *fields = [operation.response allHeaderFields]; //afnetworking写法
                               NSLog(@"cookieTouched ##fields = %@",[fields description]);
                               
                               //获取cookie方法1
                               // NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:fields forURL:url];
                               //获取cookie方法2
                               //NSString *cookieString = [[HTTPResponse allHeaderFields] valueForKey:@"Set-Cookie"];
                               //获取cookie方法3
                               NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
                               for (NSHTTPCookie *cookie in [cookieJar cookies]) {
                                   NSLog(@"cookieTouched ##cookie%@", cookie);
                               }
                           }];
    
}


- (NSString *)getCookie:(NSString *)key {
    

    NSHTTPCookieStorage *sharedHTTPCookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    if ([sharedHTTPCookieStorage cookieAcceptPolicy] != NSHTTPCookieAcceptPolicyAlways) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    }
    
    NSURL *tempUrl = self.request.URL;
    NSArray *cookies = [sharedHTTPCookieStorage cookiesForURL:tempUrl];
    NSLog(@"cookies = %@",cookies);
    
    NSEnumerator *enumerator = [cookies objectEnumerator];
    NSHTTPCookie *cookie;
    while (cookie = [enumerator nextObject])
    {
        if ([[cookie name] isEqualToString:key])
        {
            return [cookie value];
        }
    }
    
    
    
    return nil;
}




-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
    
}

//此方法可以获取网页上的数据

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"navigationType = %d",navigationType);
    
    if (navigationType == UIWebViewNavigationTypeOther) {
        
        NSLog(@"request:%@",[[request URL] absoluteString]);
        
    }
    
    NSString *tempString = [[request URL] absoluteString];
    NSString *fileName = [tempString lastPathComponent];
    NSLog(@"tempString = %@,fileName = %@",tempString,fileName);
    
    
    
    return YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
