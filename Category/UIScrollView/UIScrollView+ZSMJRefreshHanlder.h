//
//  UIScrollView+ZSMJRefreshHanlder.h
//  QJJBorrowMoney
//
//  Created by Ais on 2018/4/4.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZSRefreshHandlerTypeNone,
    ZSRefreshHandlerTypeRefresh,// 刷新
    ZSRefreshHandlerTypeLoad,   // 加载
    ZSRefreshHandlerTypeError,  // 报错
} ZSRefreshHandlerType;



@interface UIScrollView (ZSMJRefreshHanlder)
/**
 处理下拉刷新和上拉加载结束后逻辑
 
 @param refreshType 刷新还是加载
 @param pageCount 每页数据个数
 @param realCount 列表数据个数
 */
- (void)handerRefresh:(ZSRefreshHandlerType)refreshType pageCount:(NSUInteger)pageCount realCount:(NSUInteger)realCount;

@end
