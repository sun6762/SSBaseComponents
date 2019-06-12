//
//  UIColor+ZSExtension.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZSExtension)

- (UIColor *)alphe:(CGFloat)alpha;

+ (UIColor *)randomColor;

+ (UIColor *)colorWithR:(NSInteger)R G:(NSInteger)G B:(NSInteger)B A:(CGFloat)A;

+ (UIColor *)colorWithHex:(long)hex;

+ (UIColor *)colorWithHex:(long)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
