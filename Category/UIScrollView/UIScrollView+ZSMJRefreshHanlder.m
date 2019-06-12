//
//  UIScrollView+ZSMJRefreshHanlder.m
//  QJJBorrowMoney
//
//  Created by Ais on 2018/4/4.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UIScrollView+ZSMJRefreshHanlder.h"

@implementation UIScrollView (ZSMJRefreshHanlder)
- (void)handerRefresh:(ZSRefreshHandlerType)refreshType pageCount:(NSUInteger)pageCount realCount:(NSUInteger)realCount {
    [self.mj_header endRefreshing];
    if (refreshType == ZSRefreshHandlerTypeRefresh) {
        [self.mj_footer resetNoMoreData];
    } else if (refreshType == ZSRefreshHandlerTypeLoad) {
        if (realCount < pageCount) {
            [self.mj_footer endRefreshingWithNoMoreData];
        } else {
            [self.mj_footer endRefreshing];
        }
    }  else {
        [self.mj_footer endRefreshing];
    }
    
}
@end
