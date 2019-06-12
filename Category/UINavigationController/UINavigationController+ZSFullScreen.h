//
//  UINavigationController+ZSFullScreen.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZSFullScreen)

/**
 禁止右滑返回属性
 */
@property (nonatomic, assign)BOOL zs_disableInteractivePop;

@end

@interface UINavigationController (ZSFullScreen)

@end
