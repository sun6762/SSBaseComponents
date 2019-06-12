//
//  UINavigationController+ZSFullScreen.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UINavigationController+ZSFullScreen.h"
#import <objc/runtime.h>

@implementation UIViewController (ZSFullScreen)

- (BOOL)zs_disableInteractivePop{
    return [objc_getAssociatedObject(self, @selector(zs_disableInteractivePop)) boolValue];
}

- (void)setZs_disableInteractivePop:(BOOL)zs_disableInteractivePop{
    objc_setAssociatedObject(self, @selector(zs_disableInteractivePop), @(zs_disableInteractivePop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface UINavigationController()<UIGestureRecognizerDelegate>

@end

@implementation UINavigationController (ZSFullScreen)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidLoad);
        SEL swizzledSelector = @selector(zs_viewDidLoad);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)zs_viewDidLoad {
    //接替系统滑动返回手势
    NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
    id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    
    UIPanGestureRecognizer * fullScreenGesture = [[UIPanGestureRecognizer alloc]initWithTarget:internalTarget action:handler];
    fullScreenGesture.delegate = self;
    fullScreenGesture.maximumNumberOfTouches = 1;
    
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    [targetView addGestureRecognizer:fullScreenGesture];
    
    [self.interactivePopGestureRecognizer setEnabled:NO];
    
    [self zs_viewDidLoad];
}

/**
 全屏滑动返回判断
 
 @param gestureRecognizer 手势
 @return 是否响应
 */
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (self.topViewController.zs_disableInteractivePop) {
        return NO;
    }
    
    if ([gestureRecognizer translationInView:gestureRecognizer.view].x <= 0) {
        return NO;
    }
    
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    return (self.childViewControllers.count != 1);
}

//修复有水平方向滚动的ScrollView时边缘返回手势失效的问题
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return (otherGestureRecognizer.state == UIGestureRecognizerStateBegan && [otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"UILayoutContainerView")]);
}

@end
