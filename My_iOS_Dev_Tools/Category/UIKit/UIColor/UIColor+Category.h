//
//  UIColor+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define _colorRedKey_ @"R"
#define _colorGreenKey_ @"G"
#define _colorBlueKey_ @"B"
#define _colorAlphaKey_ @"Alpha"

#define _colorHueKey_ @"hue"
#define _colorSaturationKey_ @"saturation"
#define _colorBrightness_ @"brightness"

//色彩 饱和度 亮度
typedef struct
{
    CGFloat hue;
    CGFloat saturation;
    CGFloat brightness;
} HSBType;

@interface UIColor (Category)

/**获取颜色的RGB值 透明度
 *@return 成功返回一个字典 rgb键值 value NSNumber对象 否则nil
 */
- (NSDictionary*)getColorRGB;

/**颜色是否相同
 *@param color 要比较的颜色
 */
- (BOOL)isEqualToColor:(UIColor*) color;

/**获取颜色色彩 饱和度 亮度
 */
-(HSBType)HSB;

/**获取颜色的16进制
 *@return 16进制颜色值，FFFFFF
 */
- (NSString*)hexadecimalValue;

/**通过RGB值获取颜色的16进制
 *@param R 红色 0~255
 *@param G 绿色 0~255
 *@param B 蓝色 0~255
 *@return 16进制颜色值，FFFFFF
 */
+ (NSString*)hexadecimalValueFromR:(int) R G:(int) G  B:(int) B;

/**通过16进制颜色值获取颜色
 *@return 一个 UIColor对象
 */
+ (UIColor*)colorFromHexadecimal:(NSString*) hexadecimal;

/**获取16进制值
 *@param adecimal 10进制
 *@return 16进制值
 */
+ (NSString*)hexadecimalValueFromAdecimal:(int) adecimal;

/**获取10进制
 *@param hexadecimal 16进制值
 *@return 10进制值
 */
+ (NSInteger)adecimalValueFromHexadecimal:(char) hexadecimal;

/**以整数rpg初始化
 */
+ (UIColor*)colorWithR:(int) r G:(int) g B:(int) b a:(CGFloat) a;

#pragma mark - random

+ (UIColor *)randomColor;

#pragma mark - Hex

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
- (NSString *)HEXString;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

+ (UIColor *)colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;

@end
