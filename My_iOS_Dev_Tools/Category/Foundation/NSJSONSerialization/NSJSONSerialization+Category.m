//
//  NSJSONSerialization+Category.m
//  iOS_Category
//
//  Created by RenSihao on 16/3/23.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSJSONSerialization+Category.h"

@implementation NSJSONSerialization (Category)

+ (NSDictionary *)JSONDictionaryWithData:(NSData *)data
{
    if (![data isKindOfClass:[NSData class]])
    {
        NSLog(@"json解析出错！错误描述 ---> 非NSData类型");
        return nil;
    }
    
    NSError *error = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error)
    {
        NSLog(@"json解析出错！错误描述 ---> %@",error.description);
    }
    
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        return dictionary;
    }
    return nil;
}

+ (NSArray *)JSONArrayWithData:(NSData *)data
{
    if (![data isKindOfClass:[NSData class]])
    {
        NSLog(@"json解析出错！错误描述 ---> 非NSData类型");
        return nil;
    }
    
    NSError *error = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error)
    {
        NSLog(@"json解析出错！错误描述 ---> %@",error.description);
    }
    
    if ([array isKindOfClass:[NSArray class]])
    {
        return array;
    }
    return nil;
}

+ (NSMutableDictionary *)JSONDictionaryWithStream:(NSInputStream *)stream
{
    if (![stream isKindOfClass:[NSInputStream class]])
    {
        NSLog(@"json解析出错！错误描述 ---> 非NSInputStream类型");
        return nil;
    }
    
    NSError *error = nil;
    NSMutableDictionary *mutableDictonary = [NSJSONSerialization JSONObjectWithStream:stream options:NSJSONReadingMutableContainers error:&error];
    
    if (error)
    {
       NSLog(@"json解析出错！错误描述 ---> %@",error.description);
    }
    
    if ([mutableDictonary isKindOfClass:[NSMutableDictionary class]])
    {
        return mutableDictonary;
    }
    return nil;
}
+ (NSMutableArray *)JSONArrayWithStream:(NSInputStream *)stream
{
    if (![stream isKindOfClass:[NSInputStream class]])
    {
        NSLog(@"json解析出错！错误描述 ---> 非NSInputStream类型");
        return nil;
    }
    
    NSError *error = nil;
    NSMutableArray *mutableArray = [NSJSONSerialization JSONObjectWithStream:stream options:NSJSONReadingMutableContainers error:&error];
    
    if (error)
    {
        NSLog(@"json解析出错！错误描述 ---> %@",error.description);
    }
    
    if ([mutableArray isKindOfClass:[NSMutableArray class]])
    {
        return mutableArray;
    }
    return nil;
}

+ (NSData *)JSONDataFromObject:(id)object
{
    if ([NSJSONSerialization isValidJSONObject:object])
    {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        
        if (error)
        {
            NSLog(@"生成json数据出错！错误描述 ---> %@", error.description);
            return nil;
        }
        else
        {
            return data;
        }
    }
    else
    {
        NSLog(@"生成json数据出错！错误描述 ---> 非法类型");
        return nil;
    }
}

+ (NSString *)JSONStringFromObject:(id)object
{
    if ([NSJSONSerialization isValidJSONObject:object])
    {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        
        if (error)
        {
            NSLog(@"生成json字符串出错！错误描述 ---> %@", error.description);
            return @"";
        }
        else
        {
            return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    else
    {
        NSLog(@"生成json字符串出错！错误描述 ---> 非法类型");
        return @"";
    }
}

@end
