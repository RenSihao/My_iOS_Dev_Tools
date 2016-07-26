//
//  NSString+ThreeDES.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  使用该文件 -------> 注意开启 -fno-objc-arc !!!
 */

@interface NSString (ThreeDES)

/**
 *  加密
 *
 *  @param plainText   需要加密的原始字符串
 *  @param resourceURL url
 *
 *  @return 加密后的字符串
 */
+ (NSString*)encrypt:(NSString*)plainText resourceURL:(NSString *)resourceURL;

/**
 *  解密
 *
 *  @param encryptText 需要解密的原始字符串
 *  @param resourceURL url
 *
 *  @return 解密后的字符串
 */
+ (NSString*)decrypt:(NSString*)encryptText resourceURL:(NSString *)resourceURL;
@end
