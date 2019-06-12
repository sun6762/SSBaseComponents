//
//  UIImageView+ZSExtension.m
//  ZhishanFund
//
//  Created by qzwh on 2018/2/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIImageView+ZSExtension.h"

@implementation UIImageView (ZSExtension)

- (void)imageRotate {
    self.transform = CGAffineTransformMakeRotation(M_PI);
}

@end
