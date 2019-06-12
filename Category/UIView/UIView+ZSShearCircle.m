//
//  UIView+ZSShearCircle.m
//  QJJBorrowMoney
//
//  Created by qzwh on 2018/3/30.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIView+ZSShearCircle.h"

@implementation UIView (ZSShearCircle)

//剪切圆角
- (void)shearViewWithCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
