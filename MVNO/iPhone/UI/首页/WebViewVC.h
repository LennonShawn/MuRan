//
//  WebViewVC.h
//  MVNO
//
//  Created by beautyx on 15-3-25.
//  Copyright (c) 2015年 libb. All rights reserved.
//

#import "MVNOViewController.h"

@interface WebViewVC : MVNOViewController<ASIHTTPRequestDelegate,UIWebViewDelegate>{

    UIWebView *webView;

}

@property( nonatomic ,strong)ASIFormDataRequest * asiRequest;
@property(nonatomic, strong) NSURLRequest * request;
@property(nonatomic)BOOL enableGoBack;
@property(nonatomic)BOOL isCheckSession;//是否发起检查session失效的网络请求标识

- (id)initMyWebViewControllerWithURL:(NSMutableURLRequest *)request Title:(NSString *)title;
@end
