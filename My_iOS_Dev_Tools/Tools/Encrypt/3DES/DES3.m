//
//  DES3.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DES3.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

/*
 秘钥  （key） 一般是随方法调用传入的参数
 偏移量 （iv）  一般是前后端约定好的固定字符串
 */

// 密钥 3des必须是24位长度 （这里的宏定义其实没用，最多是对传入的key做一些处理）
#define gkey @"012345678901234567890123"

// 偏移量 3des必须是8位
#define gIv  @"01234567"

@implementation DES3

// 3DES加密
+ (NSString *)encryptString:(NSString *)str key:(NSString *)key
{
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    size_t plainTextBufferSize = [data length];
    const void *vplainText = (const void *)[data bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    // CCCrypt函数 加密/解密
    ccStatus = CCCrypt(kCCEncrypt,              // 加密/解密
                       kCCAlgorithm3DES,        // 加密标准 des 3des aes
                       kCCOptionPKCS7Padding,   // 选项分组密码算法(des:对每块分组加一次密 3des：对每块分组加三个不同的密)
                       vkey,                    // 密钥 加密和解密的密钥必须一致
                       kCCKeySize3DES,          // 密钥的大小
                       vinitVec,                // 可选的初始矢量
                       vplainText,              // 数据的存储单元
                       plainTextBufferSize,     // 数据的大小
                       (void *)bufferPtr,       // 用于返回数据
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = nil;
    if (ccStatus == kCCSuccess) {
        // Base64编码
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [myData base64EncodedStringWithOptions:0];
    }
    
    return result;
}


// 3DES解密
+ (NSString *)decryptString:(NSString *)str key:(NSString *)key
{
    // Base64解码
    NSData *encryptData = [[NSData alloc] initWithBase64EncodedString:str options:0];
    size_t plainTextBufferSize = [encryptData length];
    const void *vplainText = [encryptData bytes];
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    const void *vkey = (const void *) [key UTF8String];
    const void *vinitVec = (const void *) [gIv UTF8String];
    
    ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       vkey,
                       kCCKeySize3DES,
                       vinitVec,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    NSString *result = nil;
    if (ccStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:bufferPtr length:(NSUInteger)movedBytes];
        result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return result;
}

@end



