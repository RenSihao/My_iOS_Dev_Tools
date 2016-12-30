//
//  RSA.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  RSA加密工具类 
 典型的非对称性加密算法，通常用来对“秘钥”进行加密管理
 
 简单做法 ---
 1、客户端向服务器第一次发起登录请求（不传输用户名和密码）。
 2、服务器利用RSA算法产生一对公钥和私钥。并保留私钥， 将公钥发送给客户端。
 3、客户端收到公钥后， 加密用户密码， 向服务器发起第二次登录请求（传输用户名和加密后的密码）。
 4、服务器利用保留的私钥对密文进行解密，得到真正的密码。
 
 复杂做法 ---
 1、客户端向服务器第一次发起登录请求（不传输用户名和密码）。
 2、服务器利用RSA算法产生一对公钥和私钥。并保留私钥， 将公钥发送给客户端。
 3、客户端收到公钥后， 加密用户密码，向服务器发送用户名和加密后的用户密码； 同时另外产生一对公钥和私钥，自己保留私钥, 向服务器发送公钥； 于是第二次登录请求传输了用户名和加密后的密码以及客户端生成的公钥。
 4、服务器利用保留的私钥对密文进行解密，得到真正的密码。 经过判断， 确定用户可以登录后，生成sessionId和token， 同时利用客户端发送的公钥，对token进行加密。最后将sessionId和加密后的token返还给客户端。
 5、客户端利用自己生成的私钥对token密文解密， 得到真正的token。
 
 由于 RSA算法的加密解密速度要比对称算法速度慢很多，在实际应用中，通常采取如下:
 1.数据本身的加密和解密使用对称加密算法(AES)。
 2.用RSA算法加密并传输对称算法所需的密钥。
 
 参考资料：
 iOS中使用RSA加密 http://www.jianshu.com/p/74a796ec5038
 iOS使用RSA加密 http://www.jianshu.com/p/a6bb4becfd34
 */

FOUNDATION_EXTERN NSString * const RSAPrivateKeyPassword;

@interface RSA : NSObject

/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码 101626  -- by rsh 2016.11.28
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

@end


