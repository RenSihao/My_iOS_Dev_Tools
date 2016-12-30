//
//  AppDelegate.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

#import "AppDelegate+Network.h"
#import "AppDelegate+Appearance.h"

@interface AppDelegate ()

@property (nonatomic, strong, nonnull) UIViewController *rootVC;
@end

@implementation AppDelegate

/**
 每次调用方法，默认发对应系统通知
 aplication:didFimnishLanuchingWithOptions: 	UIApplicationDidFinishLaunchingNotification
 applicationDidBecomeActive                     UIApplicationDidBecomeActiveNOtification
 applicationWillResignActive                    UIApplicationWillResignActiveNotification
 applicationDidEnterBackground                  UIApplicationDidEnterBackgroundNotification
 appplicationWillEnterForeground                UIApplicationwillEnterForegroundNotification
 applicationWillTeminate                        UIApplicationWillTeminateNotification
 */
#pragma mark - App Life Cycle

//1、应用程序已经启动，并进行初始化时候调用该方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //配置窗口
    [self setUpWindow];
    
    //配置根视图
    [self setUpRootVC];
    
    //配置Network
    [self network_application:application didFinishLaunchingWithOptions:launchOptions];
    
    //配置Appearance
    [self appearance_application:application didFinishLaunchingWithOptions:launchOptions];
    
    //配置...
    
    
    return YES;
}

//2、应用将要进入到前台时候调用的方法
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

//3、应用已经进入前台并处于活动状态时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//4、应用从活动状态进入到非活动状态
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

//5、应用进入到后台时候调用的方法
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

//6、应用被终止的状态
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Window && RootViewController

- (void)setUpWindow
{
    [self.window makeKeyAndVisible];
}
- (void)setUpRootVC
{
    self.window.rootViewController = self.rootVC;
}

#pragma mark -



#pragma mark - Lazy Load

- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}
- (UIViewController *)rootVC
{
    if (!_rootVC) {
        _rootVC = [BaseTabBarController sharedInstance];
    }
    return _rootVC;
}


@end


