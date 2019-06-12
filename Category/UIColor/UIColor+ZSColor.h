//
//  UIColor+ZSColor.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZSColor)

//标题颜色 0x3B7FFF
+ (UIColor *)zs_themeColor;

//超链接蓝色
+ (UIColor *)zs_blueColor;

//辅助颜色 0xFA5050
+ (UIColor *)zs_assistColor;

//背景颜色 0xF5F5F5
+ (UIColor *)zs_bgColor;

//运用在大部分线条 0xE5E5E5
+ (UIColor *)zs_mostLineColor;

//个别线条 0xEEEEEE
+ (UIColor *)zs_severalLineColor;

//特殊强调文字颜色 0x000000
+ (UIColor *)zs_specialStressTextColor;

//标题或者重点文字 0x333333
+ (UIColor *)zs_titleOrKeyTextColor;

//一般性的阅读文字 0x666666
+ (UIColor *)zs_generalReadTextColor;

//辅助性文字 0x999999
+ (UIColor *)zs_assistTextColor;

//辅助性文字 0x888888
+ (UIColor *)zs_assistTextColor2;


//输入提示性文字 0xCCCCCC
+ (UIColor *)zs_inputHintTextColor;

//还款提示文字背景 0xFFFDE7
+ (UIColor *)zs_lightYellowHintBackgroundColor;

// 主题黄 0xFEAB1F
+ (UIColor *)zs_themeYellowColor;

//导航栏右侧按钮颜色
+ (UIColor *)zs_rightBarButtonItemTintColor;

//特殊强调文字颜色 0x151515
+ (UIColor *)zs_lightSpecialStressTextColor;

@end
