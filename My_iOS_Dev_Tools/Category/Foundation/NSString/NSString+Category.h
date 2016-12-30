//
//  NSString+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

//判断字符串是否为空,字符串不可以为空格
+ (BOOL)isEmpty:(NSString*)str;

//判断字符串是否为空,字符串可以为空格
+ (BOOL)isNull:(NSString*)str;

//判断字符串是否合法有值
- (BOOL)isValid;

/**中文编码
 */
+ (NSString*)encodeStr:(NSString *)str;

/**
 *  随机生成64为英文+数字的字符串
 *
 */
+ (NSString *)random64BitString;

/*
 对指定的参数进行url编码
 入参sourceString 是希望进行编码的字符串
 返回值是编码后的字符串,此方法对!*'();:@&=+$,/?%#[]都做了编码
 */
+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding;
+ (NSString *)encodeUrlStr:(NSString *)sourceString;

/**判断是不是纯数字
 */
- (BOOL)isNumText;

/**提取字符串中的首个数字范围
 */


/**第一个字符
 */
- (char)firstCharacter;

/**百度搜索链接
 */
+ (NSString*)baiduURLForKey:(NSString*) key;

/**获取字符串所占位置大小
 *@param font 字符串要显示的字体
 *@param width 每行最大宽度
 *@return 字符串大小
 */
- (CGSize)stringSizeWithFont:(UIFont*) font contraintWith:(CGFloat) width;

#pragma mark- md5

- (NSString *) md5;

#pragma mark- 验证合法性

/**判断是否是是手机号码
 */
- (BOOL)isMobileNumber;

/**特殊字符验证
 */
- (BOOL)isIncludeSpecialCharacter;

/**邮政编码验证
 */
- (BOOL)isZipCode;

/**验证固定电话
 */
- (BOOL)isTelPhoneNumber;

/**验证邮箱
 */
- (BOOL)isEmail;

/**是否是身份证号码
 */
- (BOOL)isCardId;

/**是否是网址
 */
- (BOOL)isURL;

/**判断是否是整数
 */
- (BOOL)isPureInt;

/**判断是否为浮点数
 */
- (BOOL)isPureFloat;


@end
