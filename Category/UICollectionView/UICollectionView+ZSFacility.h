//
//  UICollectionView+ZSFacility.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/24.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionReusableView (ZSFacility)

@property (nonatomic, strong)NSIndexPath *indexPath;

@end

@interface UICollectionViewCell (ZSFacility)

@property (nonatomic, strong)NSIndexPath *indexPath;

@end

@interface UICollectionView (ZSFacility)

- (void)quickRegisterHeaderClass:(Class)headerClass;

- (void)quickRegisterFooterClass:(Class)footerClass;

- (void)quickRegisterCellClass:(Class)cellClass;

- (__kindof UICollectionReusableView *)quickDequeueReusableHeaderClass:(Class)headerClass forIndexPath:(NSIndexPath *)indexPath;

- (__kindof UICollectionReusableView *)quickDequeueReusableFooterClass:(Class)footerClass forIndexPath:(NSIndexPath *)indexPath;

- (__kindof UICollectionViewCell *)quickDequeueReusableCellClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

@end
