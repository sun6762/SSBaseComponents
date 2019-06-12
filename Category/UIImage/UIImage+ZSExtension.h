//
//  UIImage+ZSExtension.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZSExtension)

/**
 使用颜色生成图片
 
 @param color 颜色
 @param size 大小
 @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 使用UIImageRenderingModeAlwaysOriginal渲染图片
 
 @param name 图片名
 @return 图片
 */
+ (UIImage *)originalImageNamed:(NSString *)name;

@end
