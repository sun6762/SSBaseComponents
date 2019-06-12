//
//  UITextView+ZSPlaceholder.h
//  ZhishanFund
//
//  Created by qzwh on 2018/3/4.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (ZSPlaceholder)

@property (nonatomic, readonly) UILabel *placeholderLabel;

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
