//
//  UIButton+ZSEnable.m
//  ZhishanFund
//
//  Created by Ais on 2018/3/1.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIButton+ZSEnable.h"

@implementation UIButton (ZSEnable)

- (void)zs_enable:(BOOL)isEnable
{
    self.enabled = isEnable;
    self.backgroundColor = isEnable ? [UIColor zs_themeYellowColor] : kHEXColor(0xdcdfe6);
}
@end
