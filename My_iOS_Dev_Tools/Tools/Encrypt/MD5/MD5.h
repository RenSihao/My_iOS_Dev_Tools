//
//  MD5.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/25.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

/*
 线性散列算法（又叫签名算法或者验证算法，严格来说不是加密算法）：MD5、SHA系列、HMAC系列
 目的：是为了验证数据是否被修改过。
 原理：同一明文利用同一套签名算法只会生成一串唯一密文（不可逆），若两端生成的密文不同，则证明数据被修改过。
 
 MD5特点：
 1、不可逆
 2、128bit 即32个英文数字混合字符
 3、压缩性：任意长度的数据，算出的MD5值长度都是固定的。
 4、容易计算：从原数据计算出MD5值很容易。
 5、抗修改性：对原数据进行任何改动，哪怕只修改1个字节，所得到的MD5值都有很大区别。
 6、弱抗碰撞：已知原数据和其MD5值，想找到一个具有相同MD5值的数据（即伪造数据）是非常困难的。
 7、强抗碰撞：想找到两个不同的数据，使它们具有相同的MD5值，是非常困难的。
 8、MD5加密是不可解密的，但是网上有一些解析MD5的，那个相当于一个大型的数据库，通过匹配MD5去找到原密码。所以，只要在要加密的字符串前面加上一些字母数字符号或者多次MD5加密，这样出来的结果一般是解析不出来的。解密网站:http://www.cmd5.com/
 
 MD5使用注意事项：
1、一定要和后台开发人员约定好，MD5加密的位数是16位还是32位(大多数都是32位的)，16位的可以通过32位的转换得到。
2、MD5加密区分 大小写，使用时要和后台约定好。
 */

/**
 *  MD5输出格式
 */
typedef NS_ENUM(NSUInteger, MD5Format) {
    /**
     *  32位小写
     */
    MD5Format32Lower = 1,
    /**
     *  32位大写
     */
    MD5Format32Upper,
    /**
     *  16位小写
     */
    MD5Format16Lower,
    /**
     *  16位大写
     */
    MD5Format16Upper
};

/**
 *  MD5加密工具类
 */
@interface MD5 : NSObject

// md5加密，默认32位小写加密格式
+ (NSString *)md5:(NSString *)str;

// md5加密，传入希望输出的加密格式
+ (NSString *)md5:(NSString *)str format:(MD5Format)format;

@end


