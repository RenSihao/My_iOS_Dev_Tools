//
//  NSDictionary+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

/**去空获取对象 并且如果对象是NSNumber将会以NSInteger转化成字符串
 */
- (id)stringForKey:(id<NSCopying>) key
{
    id value = [self objectForKey:key];
    
    if([value isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@", value];
    }
    
    if([value isKindOfClass:[NSString class]])
    {
        return value;
    }
    else
    {
        return nil;
    }
}

- (NSString *)stringForKeyNotNil:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    
    if([value isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@", value];
    }
    else if([value isKindOfClass:[NSString class]])
    {
        return value;
    }
    else
    {
        return @"";
    }
    
}

/**获取可转成数字的对象 NSNumber 、NSString
 */
- (id)numberForKey:(id<NSCopying>) key
{
    id value = [self objectForKey:key];
    if([value isEqual:[NSNull null]])
    {
        return nil;
    }
    else if(value == NULL)
    {
        return nil;
    }
    else
    {
        if([value isKindOfClass:[NSNumber class]])
        {
            return value;
        }
        else if([value isKindOfClass:[NSString class]])
        {
            return value;
        }
        return nil;
    }
}

/**获取字典
 */
- (NSDictionary*)dictionaryForKey:(id<NSCopying>) key
{
    NSDictionary *dic = [self objectForKey:key];
    if([dic isKindOfClass:[NSDictionary class]])
    {
        return dic;
    }
    return nil;
}

/**获取数组
 */
- (NSArray*)arrayForKey:(id<NSCopying>) key
{
    NSArray *array = [self objectForKey:key];
    if([array isKindOfClass:[NSArray class]])
    {
        return array;
    }
    return nil;
}

@end
