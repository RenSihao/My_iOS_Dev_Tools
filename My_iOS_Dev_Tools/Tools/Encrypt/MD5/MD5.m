//
//  MD5.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "MD5.h"

@implementation MD5

#pragma mark - public methods

// md5加密，默认32位小写加密格式
+ (NSString *)md5:(NSString *)str
{
    if (!str) {
        return nil;
    }
    return [self md5ToLower32:str];
}

// md5加密，传入希望输出的加密格式
+ (NSString *)md5:(NSString *)str format:(MD5Format)format
{
    if (!str) {
        return nil;
    }
    
    switch (format) {
        case MD5Format32Lower:
        {
            return [self md5ToLower32:str];
        }
            break;
        case MD5Format32Upper:
        {
            return [self md5ToUpper32:str];
        }
            break;
        case MD5Format16Lower:
        {
            return [self md5ToLower16:str];
        }
            break;
        case MD5Format16Upper:
        {
            return [self md5ToUpper16:str];
        }
            break;
    }
    return nil;
}

#pragma mark - private methods

// 32位小写
+(NSString *)md5ToLower32:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    const char * cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    return digest;
    
}

// 32位大写
+(NSString *)md5ToUpper32:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    const char * cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
}

// 16位大写
+(NSString *)md5ToUpper16:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    NSString *md5Str = [self md5ToUpper32:str];
    
    NSString *digest;
    for (int i=0; i<24; i++) {
        digest = [md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return digest;
}

// 16位小写
+(NSString *)md5ToLower16:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    NSString *md5Str = [self md5ToLower32:str];
    
    NSString *digest;
    for (int i=0; i<24; i++) {
        digest = [md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return digest;
}


@end


