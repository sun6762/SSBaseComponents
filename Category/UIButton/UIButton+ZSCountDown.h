//
//  UIButton+ZSCountDown.h
//  QJJBorrowMoney
//
//  Created by qizhi on 2019/4/18.
//  Copyright © 2019 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CountDoneBlock)(void);

@interface UIButton (ZSCountDown)

/**
 倒计时
 
 @param timeLine 倒计时时间
 @param title 正常时显示文字
 @param subTitle 倒计时时显示的文字（不包含秒）
 @param countDoneBlock 倒计时结束时的Block
 @param isInteraction 是否希望倒计时时可交互
 */

- (void)countDownWithTime:(NSInteger)timeLine withTitle:(NSString *)title andCountDownTitle:(NSString *)subTitle countDoneBlock:(CountDoneBlock)countDoneBlock isInteraction:(BOOL)isInteraction;

@end

NS_ASSUME_NONNULL_END
