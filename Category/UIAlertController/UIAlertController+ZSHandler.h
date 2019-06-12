//
//  UIAlertController+ZSHandler.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (ZSHandler)

/**
 类方法创建并显示alert
 
 @param target target
 @param title 标题
 @param message 消息
 @param cancelTitle 取消按钮
 @param cancelBack 取消事件
 @param sureTitle 确认按钮
 @param sureBack 确认时间
 */
+(void)alertForTarget:(UIViewController *)target
                title:(NSString *)title
              message:(NSString *)message
          cancelTitle:(NSString *)cancelTitle
           cancelBack:(void(^)(void))cancelBack
            sureTitle:(NSString *)sureTitle
             sureBack:(void(^)(void))sureBack;


/**
 类方法创建并显示actionSheet
 
 @param target target
 @param title 标题
 @param cancelTitle 取消按钮
 @param cancelBack 取消事件
 @param otherBack 其他的事件
 @param otherTitles 其他对应的按钮(可变参数)
 */
+(void)actionSheetForForTarget:(UIViewController *)target
                         title:(NSString *)title
                   cancelTitle:(NSString *)cancelTitle
                    cancelBack:(void(^)(void))cancelBack
                     otherBack:(void(^)(NSInteger index))otherBack
                   otherTitles:(NSString *)otherTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end
