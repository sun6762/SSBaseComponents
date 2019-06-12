//
//  UICollectionView+ZSFacility.m
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import "UICollectionView+ZSFacility.h"
#import <objc/runtime.h>

@implementation UICollectionReusableView (ZSFacility)

- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, @selector(indexPath));
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UICollectionViewCell (ZSFacility)

- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, @selector(indexPath));
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UICollectionView (ZSFacility)

- (void)quickRegisterHeaderClass:(Class)headerClass{
    [self registerClass:headerClass forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerClass)];
}

- (void)quickRegisterFooterClass:(Class)footerClass{
    [self registerClass:footerClass forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerClass)];
}

- (__kindof UICollectionReusableView *)quickDequeueReusableHeaderClass:(Class)headerClass forIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *head = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(headerClass) forIndexPath:indexPath];
    head.indexPath = indexPath;
    return head;
}

- (__kindof UICollectionReusableView *)quickDequeueReusableFooterClass:(Class)footerClass forIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *foot = [self dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(footerClass) forIndexPath:indexPath];
    foot.indexPath = indexPath;
    return foot;
}

- (void)quickRegisterCellClass:(Class)cellClass {
    [self registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

- (__kindof UICollectionViewCell *)quickDequeueReusableCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

@end
