//
//  NSString+AppFunctions.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/27.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppFunctions.h"

#pragma mark - App相关属性读取

//获取App名称
NSString *AppName()
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    
    return [dic stringForKey:@"CFBundleDisplayName"];
}

//获取App版本
NSString* appVersion()
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    
    return [dic stringForKey:@"CFBundleShortVersionString"];
}

#pragma mark - App行为设置

//注册推送通知
void registerRemoteNotification()
{
    //ios 7.0以前和以后注册推送的方法不一样
    UIApplication *application = [UIApplication sharedApplication];

    if(![application.delegate respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)])
    {
        NSLog(@"需要在 appDelegate 中实现 'application:didRegisterForRemoteNotificationsWithDeviceToken:'");

        //在实现的方法中获取 token
        //        NSString *pushToken = [[[[deviceToken description]
        //                                 stringByReplacingOccurrencesOfString:@"<" withString:@""]
        //                                stringByReplacingOccurrencesOfString:@">" withString:@""]
        //                               stringByReplacingOccurrencesOfString:@" " withString:@""];
        //        if(![NSString isEmpty:pushToken])
        //        {
        //            [[NSUserDefaults standardUserDefaults] setObject:pushToken forKey:_SeaDeviceToken_];
        //            [[NSUserDefaults standardUserDefaults] synchronize];
        //        }
    }

//    if(_ios8_0_ && ![application.delegate respondsToSelector:@selector(application:didRegisterUserNotificationSettings:)])
//    {
//        NSLog(@"需要在 appDelegate 中实现 'application:didRegisterUserNotificationSettings:'");
//        //在方法中调用
//        //[application registerForRemoteNotifications];
//    }


#ifdef __IPHONE_8_0
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:settings];
#endif

        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
}


//取消注册推送通知
void unregisterRemoteNotification()
{
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
}

//检测对象是否为NULL 或者 nil 或者 NSNull
BOOL IsNullOrNil(id value)
{
    if ([value isKindOfClass:[NSNull class]] || value == nil || [value isEqual:[NSNull null]] || value == NULL)
    {
        return YES;
    }
    return NO;
}

//字符串是否有值
BOOL isValidateString(NSString *string)
{
    if (!string)             return NO;
    if (!(string.length>0))  return NO;
    if (string == NULL)      return NO;
    if (string == nil)       return NO;
    if ([string isEqual:[NSNull null]])          return NO;
    if ([string isKindOfClass:[NSNull class]])   return NO;
    if ([string isMemberOfClass:[NSNull class]]) return NO;
    if ([string stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0) return NO;
    return YES;
}
//NSNumber是否有效
BOOL isValidateNumber(NSNumber *number)
{
    return [number isValidate];
}
//数组是否有元素
BOOL isValidateArray(NSArray *array)
{
    return [array isValidate];
}
//字典是否有键值对
BOOL isValidateDic(NSDictionary *dic)
{
    return [dic isValidate];
}

//打开系统设置
void openSystemSettings()
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
}

//根据十六进制String获取颜色
UIColor *AppHexColor(NSString *hexString)
{
    return [UIColor colorWithHexString:hexString];
}

//根据RGB获取颜色
UIColor *AppRGBColor(NSInteger r, NSInteger g, NSInteger b)
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f];
}


//根据图片名字获取对应图片
UIImage *AppImage(NSString *imageName)
{
    return [UIImage imageNamed:imageName] ? : [UIImage imageNamed:BasePlaceholderImage];
}