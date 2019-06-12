//
//  UITableView+ZSFacility.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UITableView+ZSFacility.h"

@implementation UITableViewCell (ZSFacility)

- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, @selector(indexPath));
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style{
    return [self initWithStyle:style reuseIdentifier:NSStringFromClass([self class])];
}

@end

@implementation UITableView (ZSFacility)

- (void)quickRegisterHeaderFooterClass:(Class)headerFooterClass {
    [self registerClass:headerFooterClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(headerFooterClass)];
}

- (__kindof UITableViewHeaderFooterView *)quickDequeueReusableHeaderFooterClass:(Class)headerFooterClass {
    return [self dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(headerFooterClass)];
}

- (void)quickRegisterCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (__kindof UITableViewCell *)quickDequeueReusableCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

- (__kindof UITableViewCell *)quickDequeueReusableCellClass:(Class)cellClass {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
}

@end
