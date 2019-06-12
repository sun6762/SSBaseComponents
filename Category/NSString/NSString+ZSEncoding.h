//
//  NSString+ZSEncoding.h
//  ZhishanFund
//
//  Created by qzwh on 2018/1/29.
//  Copyright © 2018年 qzwh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZSEncoding)

/**
 *  字符串转化为MD5
 *
 *  @param string 待转化的字符串
 *
 *  @return 返回md5
 */
+ (NSString *)md5:(NSString *)string;

+ (NSString *)MD5ForUpper32Bate:(NSString *)str;

@end
