//
//  UIAlertController+ZSHandler.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIAlertController+ZSHandler.h"

@implementation UIAlertController (ZSHandler)

+ (void)alertForTarget:(UIViewController *)target
                title:(NSString *)title
              message:(NSString *)message
          cancelTitle:(NSString *)cancelTitle
           cancelBack:(void(^)(void))cancelBack
            sureTitle:(NSString *)sureTitle
             sureBack:(void(^)(void))sureBack {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if (cancelTitle.length) {
        [alert addAction:[UIAlertAction actionWithTitle:cancelTitle
                                                  style:UIAlertActionStyleCancel
                                                handler:^(UIAlertAction * _Nonnull action) {
                                                    
                                                    if (cancelBack) {
                                                        cancelBack();
                                                    }
                                                }]];
    }
    if (sureTitle.length) {
        [alert addAction:[UIAlertAction actionWithTitle:sureTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
                                                    if (sureBack) {
                                                        sureBack();
                                                    }
                                                }]];
    }
    if (!target) {
        target = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    [target presentViewController:alert animated:YES completion:nil];
}


+(void)actionSheetForForTarget:(UIViewController *)target
                         title:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
                    cancelBack:(void(^)(void))cancelBack
                     otherBack:(void(^)(NSInteger index))otherBack
                   otherTitles:(NSString *)otherTitles, ... {
    
    NSMutableArray *titleArray = [NSMutableArray array];
    va_list list;
    if(otherTitles) {
        [titleArray addObject:otherTitles];
        NSString *otherTitle;
        va_start(list, otherTitles);
        while ((otherTitle = va_arg(list, NSString*))) {
            [titleArray addObject:otherTitle];
        }
        va_end(list);
    }
    
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (titleArray.count) {
        for (NSInteger i = 0; i<titleArray.count; i++) {
            
            [sheet addAction:[UIAlertAction actionWithTitle:titleArray[i]
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * _Nonnull action) {
                                                        if (otherBack){
                                                            otherBack(i);
                                                        }
                                                    }]];
        }
    }
    
    if (cancelTitle.length) {
        [sheet addAction:[UIAlertAction actionWithTitle:cancelTitle
                                                  style:UIAlertActionStyleCancel
                                                handler:^(UIAlertAction * _Nonnull action) {
                                                    
                                                    if (cancelBack) {
                                                        cancelBack();
                                                    }
                                                }]];
    }
    
    if (!target) {
        target = [UIApplication sharedApplication].keyWindow.rootViewController;
    }
    [target presentViewController:sheet animated:YES completion:nil];
    
}

@end
