//
//  AES.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  AES加密 输入输出格式
 */
typedef NS_ENUM(NSUInteger, AESEncryptFormat) {
    /**
     *  原始data -> 加密data
     */
    AESEncryptFormatDataToData = 1,
    /**
     *  原始data -> 加密str
     */
    AESEncryptFormatDataToStr,
    /**
     *  原始str -> 加密data
     */
    AESEncryptFormatStrToData,
    /**
     *  原始str -> 加密str
     */
    AESEncryptFormatStrToStr
};

/**
 *  AES解密 输入输出格式
 */
typedef NS_ENUM(NSUInteger, AESDecryptFormat) {
    /**
     *  原始data -> 解密data
     */
    AESDecryptFormatDataToData = 5,
    /**
     *  原始data -> 解密str
     */
    AESDecryptFormatDataToStr,
    /**
     *  原始str -> 解密data
     */
    AESDecryptFormatStrToData,
    /**
     *  原始str -> 解密str
     */
    AESDecryptFormatStrToStr
};

/**
 *  AES加密工具类
 *  典型对称性加密算法，通常用来对原始数据块进行加密
 */
@interface AES : NSObject

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
                  format:(AESEncryptFormat)format;


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
                 format:(AESDecryptFormat)format;

@end



