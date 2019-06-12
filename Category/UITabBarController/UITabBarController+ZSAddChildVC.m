//
//  UITabBarController+ZSAddChildVC.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UITabBarController+ZSAddChildVC.h"

@implementation UITabBarController (ZSAddChildVC)

- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
              selectTitleColor:(UIColor *)selectTitleColor
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage
            navControllerClass:(Class)navControllerClass {
    [self addChildViewController:childVc title:title titleFont:titleFont titleColor:titleColor selectTitleColor:selectTitleColor titlePosition:UIOffsetMake(0, -2) image:image selectedImage:selectedImage imageInsets:UIEdgeInsetsZero navControllerClass:navControllerClass];
}

- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
              selectTitleColor:(UIColor *)selectTitleColor
                 titlePosition:(UIOffset)titlePosition
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage
                   imageInsets:(UIEdgeInsets)imageInsets
            navControllerClass:(Class)navControllerClass {
    
    childVc.title = title;
    childVc.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    if (titleFont) {
        [childVc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:titleFont} forState:UIControlStateNormal];
    }
    if (titleColor) {
        [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor} forState:UIControlStateNormal];
    }
    if (selectTitleColor) {
        [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:selectTitleColor} forState:UIControlStateSelected];
    }
    childVc.tabBarItem.titlePositionAdjustment = titlePosition;
    childVc.tabBarItem.imageInsets = imageInsets;
    
    if (navControllerClass == nil) {
        [self addChildViewController:childVc];
    }else {
        [self addChildViewController:[[navControllerClass alloc] initWithRootViewController:childVc]];
    }
}

@end
