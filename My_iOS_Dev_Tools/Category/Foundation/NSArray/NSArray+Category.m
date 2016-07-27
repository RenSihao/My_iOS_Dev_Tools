//
//  NSArray+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)

//static BOOL IsNullOrNil(id value)
//{
//    if ([value isKindOfClass:[NSNull class]] || value ==nil || [value isEqual:[NSNull null]] || value == NULL)
//    {
//        return YES;
//    }
//    return NO;
//}

- (BOOL)isValidate
{
    if (self.count >0 && [self isKindOfClass:[NSArray class]])
    {
        return YES;
    }
    
    if (IsNullOrNil(self))
    {
        return NO;
    }
    
    return NO;
}
- (id)firstObject
{
    if (self.count > 0)
    {
        return [self objectAtIndex:0];
    }
    else
    {
        return nil;
    }
}

- (id)lastObject
{
    if (self.count > 0)
    {
        return [self objectAtIndex:self.count-1];
    }
    else
    {
        return nil;
    }
}
- (id)objectAtIndexNotBeyond:(NSUInteger)index
{
    if (self.count  > index)
    {
        return [self objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}


@end
