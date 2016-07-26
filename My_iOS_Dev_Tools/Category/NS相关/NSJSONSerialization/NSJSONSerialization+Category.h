//
//  NSJSONSerialization+Category.h
//  iOS_Category
//
//  Created by RenSihao on 16/3/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (Category)

/************************ 解析json数据 称为反序列化 *******************************/

/**
 *  json数据（NSData类型） --- > NSDictionary
 *
 *  @param data json数据
 *
 *  @return OC中的字典
 */
+ (NSDictionary *)JSONDictionaryWithData:(NSData *)data;

/**
 *  json数据（NSData类型） --- > NSArray
 *
 *  @param data json数据
 *
 *  @return OC中的数组
 */
+ (NSArray *)JSONArrayWithData:(NSData *)data;

/**
 *  json数据（NSInputStream类型） --- > NSDictonary
 *
 *  @param stream
 *
 *  @return
 */
+ (NSMutableDictionary *)JSONDictionaryWithStream:(NSInputStream *)stream;

/**
 *  json数据（NSInputStream类型） --- > NSArray
 *
 *  @param stream
 *
 *  @return 
 */
+ (NSMutableArray *)JSONArrayWithStream:(NSInputStream *)stream;




/************************ 生成json数据 称为序列化 *******************************/

/**
 *  OC对象 ---> json数据（NSData类型）
 *
 *  @param object
 *
 *  @return
 */
+ (NSData *)JSONDataFromObject:(id)object;

/**
 *  OC对象 --->json数据（NSString类型）
 *
 *  @param object OC对象
 *
 *  @return json字符串
 */
+ (NSString *)JSONStringFromObject:(id)object;

@end




