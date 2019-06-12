//
//  CAGradientLayer+ZSColor.m
//  QJJBorrowMoney
//
//  Created by qzwh on 2018/3/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "CAGradientLayer+ZSColor.h"

@implementation CAGradientLayer (ZSColor)

+ (CAGradientLayer *)zs_colorLayerWithColorArr:(NSArray *)colorArr; {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.colors = colorArr;
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    
    return layer;
}

@end
