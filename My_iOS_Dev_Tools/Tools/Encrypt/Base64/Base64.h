//
//  Base64.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Base64加密工具类
 iOS7之后，苹果在自家API内置了关于Base64的算法，因此最好不要再用其他Base64的第三方库了（例如 GTMBase64）
 参考资料：
 iOS开发探索-Base64编码 http://www.jianshu.com/p/b8a5e1c770f9
 */
@interface Base64 : NSObject

// Base64编码
+ (NSString *)base64EncodedString:(NSString *)str;
+ (NSString *)base64EncodedData:(NSData *)data;

// Base64解码
+ (NSString *)base64DecodedString:(NSString *)str;
+ (NSString *)base64DecodedData:(NSData *)data;

@end


