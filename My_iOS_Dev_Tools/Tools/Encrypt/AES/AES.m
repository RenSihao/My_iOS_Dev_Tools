//
//  AES.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AES.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation AES

#pragma mark - public methods

/**
 *  AES加密方法
 *
 *  @param key    key 秘钥
 *  @param iv     iv  偏移量
 *  @param from   原始数据
 *  @param format 决定输入输出格式
 *
 *  @return 加密后的数据
 */

+ (id)AESEncryptyWithKey:(NSString *)key
                      iv:(NSString *)iv
                    from:(id)from
                  format:(AESEncryptFormat)format
{
    switch (format) {
        case AESEncryptFormatDataToData:
        {
            if ([from isKindOfClass:[NSData class]]) {
                return [self AES128EncryptToDataWithKey:key iv:iv data:(NSData *)from];
            }
        }
            break;
        case AESEncryptFormatDataToStr:
        {
            if ([from isKindOfClass:[NSData class]]) {
                return [self AES128EncryptToStringWithKey:key iv:iv data:(NSData *)from];
            }
        }
            break;
        case AESEncryptFormatStrToData:
        {
            if ([from isKindOfClass:[NSString class]]) {
                return [self AES128EncryptToDataWithKey:key iv:iv string:(NSString *)from];
            }
        }
            break;
        case AESEncryptFormatStrToStr:
        {
            if ([from isKindOfClass:[NSString class]]) {
                return [self AES128EncryptToStringWithKey:key iv:iv string:(NSString *)from];
            }
        }
            break;
    }
    return nil;
}


/**
 *  AES解密方法
 *
 *  @param key    key 秘钥
 *  @param iv     iv  偏移量
 *  @param from   原始数据
 *  @param format 决定输入输出格式
 *
 *  @return 解密后的数据
 */
+ (id)AESDecryptWithKey:(NSString *)key
                     iv:(NSString *)iv
                   from:(id)from
                 format:(AESDecryptFormat)format
{
    switch (format) {
        case AESDecryptFormatDataToData:
        {
            if ([from isKindOfClass:[NSData class]]) {
                return [self AES128DecryptToDataWithKey:key iv:iv data:(NSData *)from];
            }
        }
            break;
        case AESDecryptFormatDataToStr:
        {
            if ([from isKindOfClass:[NSData class]]) {
                return [self AES128DecryptToStrWithKey:key iv:iv data:(NSData *)from];
            }
        }
            break;
        case AESDecryptFormatStrToData:
        {
            if ([from isKindOfClass:[NSString class]]) {
                return [self AES128DecryptToStrWithKey:key iv:iv string:(NSString *)from];
            }
        }
            break;
        case AESDecryptFormatStrToStr:
        {
            if ([from isKindOfClass:[NSString class]]) {
                return [self AES128DecryptToStrWithKey:key iv:iv string:(NSString *)from];
            }
        }
            break;
    }
    
    return nil;
}

#pragma mark - private methods (Encrypt)

// AES加密 原始data -> 加密str
+ (NSString *)AES128EncryptToStringWithKey:(NSString *)key iv:(NSString *)iv data:(NSData *)data
{
    NSData *encryptData  = [self AES128EncryptToDataWithKey:key iv:iv data:data];
    NSString *encryptStr = [[NSString alloc] initWithData:encryptData encoding:NSUTF8StringEncoding];
    return encryptStr;
}

// AES加密 原始str -> 加密data
+ (NSData *)AES128EncryptToDataWithKey:(NSString *)key iv:(NSString *)iv string:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encryptData = [self AES128EncryptToDataWithKey:key iv:iv data:data];
    return encryptData;
}

// AES加密 原始str -> 加密str
+ (NSString *)AES128EncryptToStringWithKey:(NSString *)key iv:(NSString *)iv string:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encryptStr = [self AES128EncryptToStringWithKey:key iv:iv data:data];
    return encryptStr;
}

// AES加密 原始data -> 加密data
+ (NSData *)AES128EncryptToDataWithKey:(NSString *)key iv:(NSString *)iv data:(NSData *)data
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    bzero(ivPtr, sizeof(ivPtr));
    
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    int diff = kCCKeySizeAES128 - (dataLength % kCCKeySizeAES128);
    int newSize = 0;
    
    if(diff > 0) {
        newSize = (int)(dataLength + diff);
    }
    
    char dataPtr[newSize];
    memcpy(dataPtr, [data bytes], [data length]);
    for(int i = 0; i < diff; i++) {
        dataPtr[i + dataLength] = 0x00;
    }
    
    size_t bufferSize = newSize + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          0x00, //No padding
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          dataPtr,
                                          sizeof(dataPtr),
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if(cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    return nil;
}

#pragma mark - private methods (Decrypt)

//AES解密 加密data -> 解密str
+ (NSString *)AES128DecryptToStrWithKey:(NSString *)key iv:(NSString *)iv data:(NSData *)data
{
    NSData *decryptData = [self AES128DecryptToDataWithKey:key iv:iv data:data];
    NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    return decryptStr;
}

//AES解密 加密str -> 解密data
+ (NSData *)AES128DecryptToDataWithKey:(NSString *)key iv:(NSString *)iv string:(NSString *)str
{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptData = [self AES128DecryptToDataWithKey:key iv:iv data:data];
    return decryptData;
}

//AES解密 加密str -> 解密str
+ (NSString *)AES128DecryptToStrWithKey:(NSString *)key iv:(NSString *)iv string:(NSString *)str
{
    NSData *decryptData = [self AES128DecryptToDataWithKey:key iv:iv string:str];
    NSString *decryptStr = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    return decryptStr;
}

//AES解密 加密data -> 解密data
+ (NSData *)AES128DecryptToDataWithKey:(NSString *)key iv:(NSString *)iv data:(NSData *)data
{
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCKeySizeAES128+1];
    bzero(ivPtr, sizeof(ivPtr));
    
    [iv getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          0x00, //No padding
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          ivPtr,
                                          [data bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if(cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    return nil;
    
}


@end
