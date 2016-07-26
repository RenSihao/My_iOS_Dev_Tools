//
//  UIScreen+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/15.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIScreen+Category.h"

@implementation UIScreen (Category)
/**
 *  当前屏幕尺寸
 *
 *  @return
 */
+ (CGSize)size
{
    return [UIScreen mainScreen].bounds.size;
}
/**
 *  当前屏幕宽度
 *
 *  @return
 */
+ (CGFloat)width
{
    return [self size].width;
}
/**
 *  当前屏幕高度
 *
 *  @return
 */
+ (CGFloat)height
{
    return [self size].height;
}
/**
 *  屏幕缩放像素 Retina 2.0 非Retina 1.0
 *
 *  @return
 */
+ (CGFloat)scale
{
    return [UIScreen mainScreen].scale;
}
/**
 *  可能旋转过的屏幕尺寸
 *
 *  @return
 */
+ (CGSize)orientationSize
{
    CGFloat systemVersion = [[UIDevice currentDevice].systemVersion doubleValue];
    
    BOOL isLand = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    
    return (systemVersion>8.0 && isLand) ? SizeSWAP([UIScreen size]) : [UIScreen size];
}
/**
 *  旋转后的屏幕宽度
 *
 *  @return
 */
+ (CGFloat)orientationWidth
{
    return [self orientationSize].width;
}
/**
 *  旋转后的屏幕高度
 *
 *  @return
 */
+ (CGFloat)orientationHeight
{
    return [self orientationSize].height;
}
/**
 *  当前屏幕分辨率尺寸
 *
 *  @return
 */
+ (CGSize)DPISize
{
    CGSize size = [self size];
    CGFloat scale = [self scale];
    
    return CGSizeMake(size.width*scale, size.height*scale);
}

/**
 *  交换高度与宽度
 */
static inline CGSize SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}

@end
