//
//  UINavigationController+ZSNavigationBarStyle.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZSNavigationBarStyle) {
    ZSNavigationBarStyleUnknown = 0,
    ZSNavigationBarStyleNomal, 
    ZSNavigationBarStyleNomalWithOutLine,
    ZSNavigationBarStyleBlue, //主题颜色
    ZSNavigationBarStyleBlueWithoutLine,
    ZSNavigationBarStyleWhite, //白色
    ZSNavigationBarStyleWhiteWithoutLine,
};

@interface UINavigationController (ZSNavigationBarStyle)

@property (nonatomic, assign) ZSNavigationBarStyle zs_navigationBarStyle;

@end
