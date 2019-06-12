//
//  UIViewController+ZSDealloc.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIViewController+ZSDealloc.h"
#import "NSObject+ZSRuntime.h"

@implementation UIViewController (ZSDealloc)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethodWithOriginSel:NSSelectorFromString(@"dealloc")
                                     swizzledSel:@selector(sx_dealloc)];
    });
}

- (void)sx_dealloc {
    NSLog(@"%@-dealloc",NSStringFromClass(self.class));
    [self sx_dealloc];
}

@end
