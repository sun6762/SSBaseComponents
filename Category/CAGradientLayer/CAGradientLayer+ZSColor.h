//
//  CAGradientLayer+ZSColor.h
//  QJJBorrowMoney
//
//  Created by qzwh on 2018/3/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAGradientLayer (ZSColor)

+ (CAGradientLayer *)zs_colorLayerWithColorArr:(NSArray *)colorArr;

@end
