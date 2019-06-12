//
//  UITableView+ZSFacility.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UITableViewCell (ZSFacility)

@property (nonatomic, strong)NSIndexPath *indexPath;

- (instancetype)initWithStyle:(UITableViewCellStyle)style;

@end

@interface UITableView (ZSFacility)

- (void)quickRegisterHeaderFooterClass:(Class)headerFooterClass;

- (void)quickRegisterCellClass:(Class)cellClass;

- (__kindof UITableViewHeaderFooterView *)quickDequeueReusableHeaderFooterClass:(Class)headerFooterClass;

- (__kindof UITableViewCell *)quickDequeueReusableCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

- (__kindof UITableViewCell *)quickDequeueReusableCellClass:(Class)cellClass;

@end
