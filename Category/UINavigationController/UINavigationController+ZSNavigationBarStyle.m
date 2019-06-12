//
//  UINavigationController+ZSNavigationBarStyle.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UINavigationController+ZSNavigationBarStyle.h"
#import <objc/runtime.h>

@implementation UINavigationController (ZSNavigationBarStyle)

- (ZSNavigationBarStyle)zs_navigationBarStyle{
    return [objc_getAssociatedObject(self, @selector(zs_navigationBarStyle)) unsignedIntegerValue];
}

- (void)setZs_navigationBarStyle:(ZSNavigationBarStyle)zs_navigationBarStyle{
    switch (zs_navigationBarStyle) {
        case ZSNavigationBarStyleNomal:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zs_titleOrKeyTextColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:nil]; //7.0以上设置背景颜色
            [self.navigationBar setTintColor:nil]; //7.0以下设置背景颜色
            [self.navigationBar setShadowImage:nil];
            break;
        }
        case ZSNavigationBarStyleNomalWithOutLine:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zs_titleOrKeyTextColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:nil];
            [self.navigationBar setTintColor:nil];
            [self.navigationBar setShadowImage:[UIImage new]]; //隐藏下部黑线
            break;
        }
        case ZSNavigationBarStyleBlue:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:[UIColor zs_themeColor]];
            [self.navigationBar setTintColor:[UIColor zs_themeColor]];
            [self.navigationBar setShadowImage:nil];
            break;
        }
        case ZSNavigationBarStyleBlueWithoutLine:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:[UIColor zs_themeColor]];
            [self.navigationBar setTintColor:[UIColor zs_themeColor]];
            [self.navigationBar setShadowImage:[UIImage new]];
            break;
        }
        case ZSNavigationBarStyleWhite:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zs_titleOrKeyTextColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:[UIColor whiteColor]];
            [self.navigationBar setTintColor:[UIColor zs_titleOrKeyTextColor]];
            [self.navigationBar setShadowImage:nil];

            break;
        }
        case ZSNavigationBarStyleWhiteWithoutLine:
        {
            [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor zs_titleOrKeyTextColor],NSFontAttributeName : kRegularFont(18)}];
            [self.navigationBar setBarTintColor:[UIColor whiteColor]];
            [self.navigationBar setTintColor:[UIColor zs_titleOrKeyTextColor]];
            [self.navigationBar setShadowImage:[UIImage new]];
            break;
        }
        default:
            break;
    }
    objc_setAssociatedObject(self, @selector(zs_navigationBarStyle), @(zs_navigationBarStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
