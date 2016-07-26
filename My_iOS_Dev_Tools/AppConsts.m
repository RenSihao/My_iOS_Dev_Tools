//
//  AppConsts.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppConsts.h"

#pragma mark - 字体

NSString * const MainFontName = @"Helvetica";
NSString * const MainNumberFontName = @"Helvetica";
NSString * const MainEnglishFontName = @"Helvetica";


#pragma mark - 颜色



#pragma mark - 尺寸



#pragma mark - 时间



#pragma mark - 网络


#pragma mark - 通知



#pragma mark - 函数

//获取app名称
NSString* appName()
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    
    return [dic objectForKey:@"CFBundleDisplayName"];
}

//获取app版本
NSString* appVersion()
{
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    
    return [dic objectForKey:@"CFBundleShortVersionString"];
}

//注册推送通知
//void registerRemoteNotification()
//{
//    //ios 7.0以前和以后注册推送的方法不一样
//    UIApplication *application = [UIApplication sharedApplication];
//    
//    if(![application.delegate respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)])
//    {
//        NSLog(@"需要在 appDelegate 中实现 'application:didRegisterForRemoteNotificationsWithDeviceToken:'");
//        
//        //在实现的方法中获取 token
//        //        NSString *pushToken = [[[[deviceToken description]
//        //                                 stringByReplacingOccurrencesOfString:@"<" withString:@""]
//        //                                stringByReplacingOccurrencesOfString:@">" withString:@""]
//        //                               stringByReplacingOccurrencesOfString:@" " withString:@""];
//        //        if(![NSString isEmpty:pushToken])
//        //        {
//        //            [[NSUserDefaults standardUserDefaults] setObject:pushToken forKey:_SeaDeviceToken_];
//        //            [[NSUserDefaults standardUserDefaults] synchronize];
//        //        }
//    }
    
//    if(_ios8_0_ && ![application.delegate respondsToSelector:@selector(application:didRegisterUserNotificationSettings:)])
//    {
//        NSLog(@"需要在 appDelegate 中实现 'application:didRegisterUserNotificationSettings:'");
//        //在方法中调用
//        //[application registerForRemoteNotifications];
//    }
//    

//#ifdef __IPHONE_8_0
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
//        [application registerUserNotificationSettings:settings];
//#endif
//
//        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
//}


//取消注册推送通知
void unregisterRemoteNotification()
{
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
}

//字符串是否合法有效
BOOL isValidateString(NSString *string)
{
    return ( (!IsNull(string)) && (!IsEmpty(string)) );
}

//打开系统设置
void openSystemSettings()
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}
