//
//  NSDictionary+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/**
 *  去空获取对象 并且如果对象是NSNumber将会以NSInteger转化成字符串
 *
 *  @param key
 *
 *  @return
 */
- (id)stringForKey:(id<NSCopying>) key;

/**
 *  做了判空处理 即使服务器返回NULL 或者没有该字段 也会返回一个@""
 *
 *  @param key
 *
 *  @return
 */
- (NSString *)stringForKeyNotNil:(id<NSCopying>)key;

/**
 *  获取可转成数字的对象 NSNumber 、NSString
 *
 *  @param key
 *
 *  @return
 */
- (id)numberForKey:(id<NSCopying>)key;

/**
 *  获取字典
 *
 *  @param key
 *
 *  @return
 */
- (NSDictionary*)dictionaryForKey:(id<NSCopying>)key;

/**
 *  获取数组
 *
 *  @param key
 *
 *  @return
 */
- (NSArray*)arrayForKey:(id<NSCopying>)key;

@end
