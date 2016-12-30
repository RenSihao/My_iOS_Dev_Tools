//
//  DES3.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  3DES加密工具类
 */
@interface DES3 : NSObject

// 3DES加密
+ (NSString *)encryptString:(NSString *)str key:(NSString *)key;

// 3DES解密
+ (NSString *)decryptString:(NSString *)str key:(NSString *)key;

@end
