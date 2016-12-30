//
//  Base64.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "Base64.h"

@implementation Base64

// Base64编码
+ (NSString *)base64EncodedString:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [self base64EncodedData:data];
}
+ (NSString *)base64EncodedData:(NSData *)data
{
    return [data base64EncodedStringWithOptions:0];
}

// Base64解码
+ (NSString *)base64DecodedString:(NSString *)str;
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    return [self base64DecodedData:data];
}
+ (NSString *)base64DecodedData:(NSData *)data
{
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
