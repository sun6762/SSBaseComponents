//
//  UITabBarController+ZSAddChildVC.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (ZSAddChildVC)

/**
 添加一个子控制器
 
 @param childVc 子控制器
 @param title 标题
 @param titleFont 标题字体样式
 @param titleColor 字体颜色
 @param selectTitleColor 选中字体颜色
 @param image 图片
 @param selectedImage 选中图片
 @param navControllerClass 包装子控制器的导航控制器
 */
- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
              selectTitleColor:(UIColor *)selectTitleColor
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage
            navControllerClass:(Class)navControllerClass;


/**
 添加一个子控制器
 
 @param childVc 子控制器
 @param title 标题
 @param titleFont 字体
 @param titleColor 字体颜色
 @param selectTitleColor 选中字体颜色
 @param titlePosition 标题偏移
 @param image 图片
 @param selectedImage 选中图片
 @param imageInsets 图片偏移
 @param navControllerClass 包装子控制器的导航控制器
 */
- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
              selectTitleColor:(UIColor *)selectTitleColor
                 titlePosition:(UIOffset)titlePosition
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage
                   imageInsets:(UIEdgeInsets)imageInsets
            navControllerClass:(Class)navControllerClass;

@end
