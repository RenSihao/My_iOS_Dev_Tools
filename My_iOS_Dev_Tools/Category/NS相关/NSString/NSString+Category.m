//
//  NSString+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Category)

//判断字符串是否为空
+ (BOOL)isEmpty:(NSString *)str
{
    if([str isEqual:[NSNull null]])
    {
        return YES;
    }
    
    if(str == nil)
    {
        return YES;
    }
    
    if(str == NULL)
    {
        return YES;
    }
    
    if([str stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0)
    {
        return YES;
    }
    return NO;
}

/**判断字符串是否为空,字符串可以为空格
 */
+ (BOOL)isNull:(NSString *)str
{
    if([str isEqual:[NSNull null]])
    {
        return YES;
    }
    
    if(str == nil)
    {
        return YES;
    }
    
    if(str == NULL)
    {
        return YES;
    }
    
    if(str.length == 0)
        return YES;
    
    return NO;
}

- (BOOL)isValid
{
    if ([NSString isNull:self] || [NSString isEmpty:self])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

//中文编码
+ (NSString*)encodeStr:(NSString *)str
{
    CFStringRef url = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8);
    
    NSString *ret = [NSString stringWithFormat:@"%@",(__bridge NSString*)url];
    CFRelease(url);
    
    return ret;
}

+ (NSString*)URLencode:(NSString *)originalString stringEncoding:(NSStringEncoding)stringEncoding {
    //!  @  $  &  (  )  =  +  ~  `  ;  '  :  ,  /  ?
    //%21%40%24%26%28%29%3D%2B%7E%60%3B%27%3A%2C%2F%3F
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
                            @"@" , @"&" , @"=" , @"+" ,    @"$" , @"," ,
                            @"!", @"'", @"(", @")", @"*", nil];
    
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F", @"%3F" , @"%3A" ,
                             @"%40" , @"%26" , @"%3D" , @"%2B" , @"%24" , @"%2C" ,
                             @"%21", @"%27", @"%28", @"%29", @"%2A", nil];
    
    NSInteger len = [escapeChars count];
    
    NSMutableString *temp = [[originalString stringByAddingPercentEscapesUsingEncoding:stringEncoding]
                             mutableCopy];
    
    NSInteger i;
    for (i = 0; i < len; i++) {
        [temp replaceOccurrencesOfString:[escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *outStr = [NSString stringWithString:temp];
    
    return outStr;
}

/*
 对指定的参数进行url编码
 入参sourceString 是希望进行编码的字符串
 返回值是编码后的字符串,此方法对!*'();:@&=+$,/?%#[]都做了编码
 */
+(NSString *) encodeUrlStr:(NSString *)sourceString
{
    NSString *encodedString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                        NULL,
                                                                                        (CFStringRef)sourceString,
                                                                                        NULL,
                                                                                        (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                        kCFStringEncodingUTF8 ));
    return encodedString;
}


//判断是不是纯数字
- (BOOL)isNumText
{
    if([self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]].length)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

/**第一个字符
 */
- (char)firstCharacter
{
    if(self.length > 0)
    {
        return [self characterAtIndex:0];
    }
    else
    {
        return 0;
    }
}

//百度搜索链接
+ (NSString*)baiduURLForKey:(NSString *)key
{
    NSString *url = [NSString stringWithFormat:@"http://www.baidu.com/s?word=%@", key];
    url = [[self class] encodeStr:url];
    return url;
}

/**获取字符串所占位置大小
 *@param font 字符串要显示的字体
 *@param width 每行最大宽度
 *@return 字符串大小
 */
- (CGSize)stringSizeWithFont:(UIFont*) font contraintWith:(CGFloat) width
{
    CGSize size;
    CGSize contraintSize = CGSizeMake(width, CGFLOAT_MAX);

#ifdef __IPHONE_7_0
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    size = [self boundingRectWithSize:contraintSize  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
#else
        size = [self sizeWithFont:font constrainedToSize:contraintSize lineBreakMode:NSLineBreakByCharWrapping];
#endif
    
    return size;
}

#pragma mark- md5

- (NSString*)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark- 验证合法性

//判断手机号是否合法
- (BOOL)isMobileNumber
{
    if(self.length != 11)
    {
        return NO;
    }
    //手机号码
    NSString *mobile = @"^1(3[0-9]|5[0-35-9]|8[0125-9])\\d{8}$";
    //中国移动
    NSString *CM = @"^1(3[4-9]|5[012789]|8[78])\\d{8}$";
    //中国联通
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    //中国电信
    NSString *CT = @"^1((33|53|8[0-9])[0-9]|349)\\d{7}$";
    //小灵通
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    //设定断言
    NSPredicate *regextestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    NSPredicate *regextestCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    NSPredicate *regextestCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    NSPredicate *regextestCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    
    if(([regextestMobile evaluateWithObject:self] == YES) ||
       ([regextestCM evaluateWithObject:self] == YES) ||
       ([regextestCU evaluateWithObject:self] == YES) ||
       ([regextestCT evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

//特殊字符验证
- (BOOL)isIncludeSpecialCharacter
{
    NSRange urgentRange = [self rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}

//验证邮政编码
- (BOOL)isZipCode
{
    if(self.length != 6)
    {
        return NO;
    }
    return YES;
}

//验证固定电话
- (BOOL)isTelPhoneNumber
{
    if(self.length >= 7)
        return YES;
    
    NSString *phoneRegex = @"^(\\d{3,4}\\-?)?\\d{7,8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    if(![predicate evaluateWithObject:self])
    {
        return NO;
    }
    return YES;
}

//邮箱验证
- (BOOL)isEmail
{
    //邮箱正则表达式验证
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    if(![predicate evaluateWithObject:self])
    {
        return NO;
    }
    return YES;
}


//身份证
- (BOOL)isCardId
{
    if(self.length > 18)
    {
        return NO;
    }
    
    
    NSString *regex18 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    
    NSPredicate *predicate18 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex18];
    
    if(![predicate18 evaluateWithObject:self])
    {
        return NO;
    }
    return YES;
}

//是否是网址
- (BOOL)isURL
{
    NSString *urlRegex = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSString *str = [NSString encodeStr:self];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",urlRegex];
    
    if(![predicate evaluateWithObject:str])
    {
        urlRegex = @"\\b(https?)://(?:(\\S+?)(?::(\\S+?))?@)?([a-zA-Z0-9\\-.]+)(?::(\\d+))?((?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",urlRegex];
        if(![predicate evaluateWithObject:str])
        {
            return NO;
        }
        else
        {
            return YES;
        }
    }
    return YES;
}

/**判断是否是整数
 */
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**判断是否为浮点数
 */
- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

@end
