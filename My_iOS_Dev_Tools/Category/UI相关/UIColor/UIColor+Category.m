//
//  UIColor+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIColor+Category.h"
#import "NSString+Category.h"

@implementation UIColor (Category)

/**获取颜色的RGB值 透明度 只有当颜色是由RGB组成的才有返回
 *@return 成功返回一个字典 rgb键值 否则返回nil
 */
- (NSDictionary*)getColorRGB
{
    
    CGFloat R, G, B, alpha;
    
    BOOL success = [self getRed:&R green:&G blue:&B alpha:&alpha];
    
    if(success)
    {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithFloat:R], _colorRedKey_,
                             [NSNumber numberWithFloat:G], _colorGreenKey_,
                             [NSNumber numberWithFloat:B], _colorBlueKey_,
                             [NSNumber numberWithFloat:alpha], _colorAlphaKey_,
                             nil];
        return dic;
    }
    
    return nil;
}

/**颜色是否相同
 *@param color 要比较的颜色
 */
- (BOOL)isEqualToColor:(UIColor*) color
{
    NSDictionary *dic1 = [self getColorRGB];
    NSDictionary *dic2 = [color getColorRGB];
    
    if(dic1 == nil || dic2 == nil)
        return NO;
    
    CGFloat R1 = [[dic1 objectForKey:_colorRedKey_] floatValue];
    CGFloat G1 = [[dic1 objectForKey:_colorGreenKey_] floatValue];
    CGFloat B1 = [[dic1 objectForKey:_colorBlueKey_] floatValue];
    CGFloat A1 = [[dic1 objectForKey:_colorAlphaKey_] floatValue];
    
    CGFloat R2 = [[dic2 objectForKey:_colorRedKey_] floatValue];
    CGFloat G2 = [[dic2 objectForKey:_colorGreenKey_] floatValue];
    CGFloat B2 = [[dic2 objectForKey:_colorBlueKey_] floatValue];
    CGFloat A2 = [[dic2 objectForKey:_colorAlphaKey_] floatValue];
    
    if(R1 == R2 && B1 == B2 && G1 == G2 && A1 == A2)
    {
        return YES;
    }
    
    return NO;
}

/**获取颜色色彩 饱和度 亮度
 */
- (HSBType)HSB
{
    HSBType hsb;
    
    hsb.hue = 0;
    hsb.saturation = 0;
    hsb.brightness = 0;
    
    CGColorSpaceModel model = CGColorSpaceGetModel(CGColorGetColorSpace([self CGColor]));
    
    if ((model == kCGColorSpaceModelMonochrome) || (model == kCGColorSpaceModelRGB))
    {
        const CGFloat *c = CGColorGetComponents([self CGColor]);
        
        float x = fminf(c[0], c[1]);
        x = fminf(x, c[2]);
        
        float b = fmaxf(c[0], c[1]);
        b = fmaxf(b, c[2]);
        
        if (b == x)
        {
            hsb.hue = 0;
            hsb.saturation = 0;
            hsb.brightness = b;
        }
        else
        {
            float f = (c[0] == x) ? c[1] - c[2] : ((c[1] == x) ? c[2] - c[0] : c[0] - c[1]);
            int i = (c[0] == x) ? 3 : ((c[1] == x) ? 5 : 1);
            
            hsb.hue = ((i - f /(b - x))/6);
            hsb.saturation = (b - x)/b;
            hsb.brightness = b;
        }
    }
    
    return hsb;
}

/**获取颜色的16进制
 *@return 16进制颜色值，FFFFFF
 */
- (NSString*)hexadecimalValue
{
    NSDictionary *dic = [self getColorRGB];
    if(dic != nil)
    {
        int R = [[dic objectForKey:_colorRedKey_] floatValue] * 255;
        int G = [[dic objectForKey:_colorGreenKey_] floatValue] * 255;
        int B = [[dic objectForKey:_colorBlueKey_] floatValue] * 255;
        
        return [UIColor hexadecimalValueFromR:R G:G B:B];
    }
    return @"000000";
}

/**通过RGB值获取颜色的16进制
 *@param R 红色 0~255
 *@param G 绿色 0~255
 *@param B 蓝色 0~255
 *@return 16进制颜色值，FFFFFF
 */
+ (NSString*)hexadecimalValueFromR:(int) R G:(int) G  B:(int) B
{
    NSString *hex = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                     [UIColor hexadecimalValueFromAdecimal:R / 16],
                     [UIColor hexadecimalValueFromAdecimal:R % 16],
                     [UIColor hexadecimalValueFromAdecimal:G / 16],
                     [UIColor hexadecimalValueFromAdecimal:G % 16],
                     [UIColor hexadecimalValueFromAdecimal:B / 16],
                     [UIColor hexadecimalValueFromAdecimal:B % 16]
                     ];
    return hex;
}

/**通过16进制颜色值获取颜色
 *@return 一个 UIColor对象
 */
+ (UIColor*)colorFromHexadecimal:(NSString*) hexadecimal
{
    if(hexadecimal.length >= 6)
    {
        NSString *hexR = [hexadecimal substringWithRange:NSMakeRange(0, 2)];
        NSString *hexG = [hexadecimal substringWithRange:NSMakeRange(2, 2)];
        NSString *hexB = [hexadecimal substringWithRange:NSMakeRange(4, 2)];
        
        CGFloat R = [UIColor adecimalValueFromHexadecimal:[hexR firstCharacter]] * 16 + [UIColor adecimalValueFromHexadecimal:[hexR characterAtIndex:1]];
        CGFloat G = [UIColor adecimalValueFromHexadecimal:[hexG firstCharacter]] * 16 + [UIColor adecimalValueFromHexadecimal:[hexG characterAtIndex:1]];
        CGFloat B = [UIColor adecimalValueFromHexadecimal:[hexB firstCharacter]] * 16 + [UIColor adecimalValueFromHexadecimal:[hexB characterAtIndex:1]];
        
        return [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:1.0];
    }
    else
    {
        return [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    }
}

/**获取16进制值
 *@param adecimal 10进制
 *@return 16进制值
 */
+ (NSString*)hexadecimalValueFromAdecimal:(int) adecimal
{
    switch (adecimal)
    {
        case 10 :
        {
            return @"A";
        }
            break;
        case 11 :
        {
            return @"B";
        }
        case 12 :
        {
            return @"C";
        }
        case 13 :
        {
            return @"D";
        }
            break;
        case 14 :
        {
            return @"E";
        }
            break;
        case 15 :
        {
            return @"F";
        }
            break;
        default:
        {
            return [NSString stringWithFormat:@"%d", adecimal];
        }
            break;
    }
}

/**获取10进制
 *@param
 *@return 10进制值
 */
+ (NSInteger)adecimalValueFromHexadecimal:(char)hexadecimal
{
    switch (hexadecimal)
    {
        case 'A' :
        {
            return 10;
        }
            break;
        case 'B' :
        {
            return 11;
        }
        case 'C' :
        {
            return 12;
        }
        case 'D' :
        {
            return 13;
        }
            break;
        case 'E' :
        {
            return 14;
        }
            break;
        case 'F' :
        {
            return 15;
        }
            break;
        default:
        {
            return [[NSString stringWithFormat:@"%c", hexadecimal] integerValue];
        }
            break;
    }
}

/**以整数rpg初始化
 */
+ (UIColor*)colorWithR:(int) r G:(int) g B:(int) b a:(CGFloat) a
{
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a];
}
+ (UIColor *)randomColor {
    //detail implementation
    //arc4random() % 78 will return a number between 0 and 77, for example.
    CGFloat hue = arc4random() % 100 / 100.0; //色调：0.0 ~ 1.0
    CGFloat saturation = (arc4random() % 50 / 100) + 0.5; //饱和度：0.5 ~ 1.0
    CGFloat brightness = (arc4random() % 50 / 100) + 0.5; //亮度：0.5 ~ 1.0
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
