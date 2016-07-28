//
//  NSString+AppFunctions.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/27.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  本类包含了很多iOS开发便利函数，欢迎使用 -。- 
 *
 *  注意 --> 单独使用本类，需要依赖pch中的某些categor ！
 */

#pragma mark - App相关属性读取
UIKIT_EXTERN NSString *AppName();
UIKIT_EXTERN NSString *AppVersion();

#pragma mark - App行为设置
UIKIT_EXTERN void registerRemoteNotification();
UIKIT_EXTERN void unregisterRemoteNotification();
UIKIT_EXTERN void openSystemSettings();


#pragma mark - 合法性检测工具，防止Crash
UIKIT_EXTERN BOOL IsNullOrNil(id value);
UIKIT_EXTERN BOOL IsValidateObject(id object);
UIKIT_EXTERN BOOL IsValidateString(NSString *string);
UIKIT_EXTERN BOOL IsValidateNumber(NSNumber *number);
UIKIT_EXTERN BOOL IsValidateArray(NSArray *array);
UIKIT_EXTERN BOOL IsValidateDic(NSDictionary *dic);
UIKIT_EXTERN void AppAssert(id value, id cls, NSString *crashMessage);

#pragma mark - 颜色工具
UIKIT_EXTERN UIColor *AppHexColor(NSString *hexString);
UIKIT_EXTERN UIColor *AppRGBColor(NSInteger r, NSInteger g, NSInteger b);


#pragma mark - 图片工具
UIKIT_EXTERN UIImage *AppImage(NSString *imageName);














