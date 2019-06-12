//
//  UIColor+ZSExtension.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIColor+ZSExtension.h"

@implementation UIColor (ZSExtension)

- (UIColor *)alphe:(CGFloat)alpha{
    return [self colorWithAlphaComponent:alpha];
}

+ (UIColor *)colorWithR:(NSInteger)R G:(NSInteger)G B:(NSInteger)B A:(CGFloat)A{
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A];
}

+ (UIColor *)randomColor{
    return [UIColor colorWithR:arc4random_uniform(256)
                             G:arc4random_uniform(256)
                             B:arc4random_uniform(256)
                             A:1];
}

+ (UIColor *)colorWithHex:(long)hex {
    NSInteger R = (hex & 0xFF0000) >> 16;
    NSInteger G = (hex & 0xFF00) >> 8;
    NSInteger B = hex & 0xFF;
    return [UIColor colorWithR:R G:G B:B A:1];
}

+ (UIColor *)colorWithHex:(long)hex alpha:(CGFloat)alpha {
    NSInteger R = (hex & 0xFF0000) >> 16;
    NSInteger G = (hex & 0xFF00) >> 8;
    NSInteger B = hex & 0xFF;
    return [UIColor colorWithR:R G:G B:B A:alpha];
}


+ (UIColor *)colorWithHexString: (NSString *)hexString {
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) return [UIColor clearColor];
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    NSRange range; range.location = 0; range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4; NSString *bString = [cString substringWithRange:range];
    
    unsigned int R, G, B;
    [[NSScanner scannerWithString:rString] scanHexInt:&R];
    [[NSScanner scannerWithString:gString] scanHexInt:&G];
    [[NSScanner scannerWithString:bString] scanHexInt:&B];
    
    return [UIColor colorWithR:R G:G B:B A:1];
}

@end
