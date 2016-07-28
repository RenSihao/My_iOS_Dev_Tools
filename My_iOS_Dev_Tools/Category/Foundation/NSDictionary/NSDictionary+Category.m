//
//  NSDictionary+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

//static BOOL IsNullOrNil(id value)
//{
//    if ([value isKindOfClass:[NSNull class]] || value ==nil || [value isEqual:[NSNull null]] || value == NULL)
//    {
//        return YES;
//    }
//    return NO;
//}

#pragma mark - Safe Access

- (BOOL)isValidate
{
    if (self.count > 0 && [self isKindOfClass:[NSDictionary class]])
    {
        return YES;
    }
    if (IsNullOrNil(self))
    {
        return NO;
    }
    return NO;
}

- (BOOL)hasKey:(NSString *)key
{
    return [self objectForKey:key] != nil;
}

- (NSString *)stringForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value stringValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return (NSString *)value;
    }
    if (IsNullOrNil(value))
    {
        return @"";
    }
    
    return @"";
}

- (NSNumber *)numberForKey:(id<NSCopying>)key
{
    id value = [self objectForKey:key];
    
    if ([value isKindOfClass:[NSNumber class]])
    {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        //确保万一出现非数字字符，程序不会出错
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        return [formatter numberFromString:(NSString *)value];
    }
    if (IsNullOrNil(value))
    {
        return nil;
    }
    
    return nil;
}

//- (NSDecimalNumber *)decimalNumberForKey:(id)key
//{
//    id value = [self objectForKey:key];
//    
//    if ([value isKindOfClass:[NSDecimalNumber class]])
//    {
//        return (NSDecimalNumber *)value;
//    }
//    if ([value isKindOfClass:[NSNumber class]])
//    {
//        NSNumber *number = (NSNumber *)value;
//        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
//    }
//    if ([value isKindOfClass:[NSString class]])
//    {
//        NSString *str = (NSString *)value;
//        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
//    }
//    return nil;
//}

- (NSArray *)arrayForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary *)dictionaryForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)integerForKey:(id)key
{
    id value = [self objectForKey:key];
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)unsignedIntegerForKey:(id)key
{
    id value = [self objectForKey:key];
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)boolForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)int16ForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)int32ForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)int64ForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}
- (char)charForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}
- (short)shortForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)floatForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)doubleForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}
- (long long)longLongForKey:(id)key
{
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)unsignedLongLongForKey:(id)key
{
    id value = [self objectForKey:key];
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
        return [value unsignedLongLongValue];
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (NSDate *)dateForKey:(id)key dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self objectForKey:key];
    
    if (IsNullOrNil(value))
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat)
    {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)CGFloatForKey:(id)key
{
    CGFloat f = [self[key] doubleValue];
    return f;
}

- (CGPoint)pointForKey:(id)key
{
    CGPoint point = CGPointFromString(self[key]);
    return point;
}
- (CGSize)sizeForKey:(id)key
{
    CGSize size = CGSizeFromString(self[key]);
    return size;
}
- (CGRect)rectForKey:(id)key
{
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}




@end
