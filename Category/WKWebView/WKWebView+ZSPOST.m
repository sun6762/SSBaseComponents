//
//  WKWebView+ZSPOST.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "WKWebView+ZSPOST.h"
#import "NSObject+ZSRuntime.h"

@implementation WKWebView (ZSPOST)

- (void)zs_loadRequest:(NSURLRequest *)request {
    if ([[request.HTTPMethod uppercaseString] isEqualToString:@"POST"]){
        if (request.allHTTPHeaderFields.count) {
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                NSString *htmlStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                [self loadHTMLString:htmlStr baseURL:nil];
            }];
            [task resume];
        } else {
            NSString *url = request.URL.absoluteString;
            NSString *params = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
            NSLog(@"网页post请求参数:%@", params);
            
            NSString *postJavaScript = [NSString stringWithFormat:@"\
                                        var url = '%@';\
                                        var params = %@;\
                                        var form = document.createElement('form');\
                                        form.setAttribute('method', 'post');\
                                        form.setAttribute('action', url);\
                                        form.setAttribute('Content-Type', 'application/json');\
                                        for(var key in params) {\
                                        if(params.hasOwnProperty(key)) {\
                                        var hiddenField = document.createElement('input');\
                                        hiddenField.setAttribute('type', 'hidden');\
                                        hiddenField.setAttribute('name', key);\
                                        hiddenField.setAttribute('value', encodeURI(params[key]));\
                                        form.appendChild(hiddenField);\
                                        }\
                                        }\
                                        document.body.appendChild(form);\
                                        form.submit();", url, params];
            __weak typeof(self) weakSelf = self;
            [self evaluateJavaScript:postJavaScript completionHandler:^(id object, NSError * _Nullable error) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if (error && [strongSelf.navigationDelegate respondsToSelector:@selector(webView:didFailProvisionalNavigation:withError:)]) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [strongSelf.navigationDelegate webView:strongSelf didFailProvisionalNavigation:nil withError:error];
                    });
                }
            }];
        }
    } else {
        [self loadRequest:request];
    }
}

@end
