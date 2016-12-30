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

#pragma mark - 合法性检测工具，防止Crash
//检测字符串、数组、字典、数字，是否合法、有效、有值、有意义
BOOL IsValidateObject(id object)
{
    if (IsNullOrNil(object)) return NO;
    
    if ([object isKindOfClass:[NSString class]] && IsValidateString(object))
    {
        return YES;
    }
    
    if ([object isKindOfClass:[NSArray class]] && IsValidateArray(object))
    {
        return YES;
    }
    
    if ([object isKindOfClass:[NSDictionary class]] && IsValidateDic(object))
    {
        return YES;
    }
    
    if ([object isKindOfClass:[NSNumber class]] && IsValidateNumber(object))
    {
        return YES;
    }
    
    NSLog(@"该OC对象异常！");
    return NO;
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
BOOL IsValidateString(NSString *string)
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
BOOL IsValidateNumber(NSNumber *number)
{
    return [number isValidate];
}
//数组是否有元素
BOOL IsValidateArray(NSArray *array)
{
    return [array isValidate];
}
//字典是否有键值对
BOOL IsValidateDic(NSDictionary *dic)
{
    return [dic isValidate];
}
//程序执行对象合法性断言
void AppAssert(id value, id cls, NSString *crashMessage)
{
    NSCAssert(IsValidateObject(value), @"崩溃文件：%@ \n 崩溃原因：%@ ",
              NSStringFromClass([cls class]), IsValidateString(crashMessage) ? crashMessage : @"不能为nil！");
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

#pragma mark - 颜色工具
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

#pragma mark - 图片工具
//根据图片名字获取对应图片
UIImage *AppImage(NSString *imageName)
{
    return [UIImage imageNamed:imageName] ? : [UIImage imageNamed:BasePlaceholderImage];
}


#pragma mark - 快捷方法

UIKIT_EXTERN NSString *LocalFilePath(NSString *fileName)
{
    return [[NSBundle mainBundle] pathForResource:fileName ofType:nil] ? : @"";
}
void DeselectTableView(UITableView *tableView, NSIndexPath *indexPath)
{
    NSTimeInterval delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    });
}
NSUserDefaults *AppUserDefault()
{
    return [NSUserDefaults standardUserDefaults];
}

void AppUserDefaultInteger(NSInteger value, NSString *key)
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
void AppUserDefaultString(NSString *value, NSString *key)
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
void AppUserDefaultBool(BOOL value, NSString *key)
{
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

UITableViewCell *DefaultCell(UITableView *tableView)
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    return cell;
}
UIView *AppTableViewClearHeaderView()
{
    UIView *header = [UIView new];
    header.userInteractionEnabled = NO;
    return header;
}
UIView *AppTableViewClearFooterView()
{
    UIView *footer = [UIView new];
    footer.userInteractionEnabled = NO;
    return footer;
}
UIEdgeInsets AppCellSeparateLineInsets()
{
    return UIEdgeInsetsMake(0, 18.5, 0, 0);
}
UIWindow *AppKeyWindow()
{
    return [UIApplication sharedApplication].keyWindow;
}














