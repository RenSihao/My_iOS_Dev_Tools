//
//  AppDelegate+Network.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "AppDelegate+Network.h"
#import "RSHUrlArgumentsFilter.h"

@implementation AppDelegate (Network)

/**
 *  此处配置Network全局参数
 */
- (BOOL)network_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 全局Network配置
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    
    // 设置BaseURL
    config.baseUrl = @"http://www.baidu.com";
    
    // 获取 request header 尾部公共参数
    NSMutableDictionary *baseRequestTail = [NSMutableDictionary new];
    //...
    
    RSHUrlArgumentsFilter *filter = [RSHUrlArgumentsFilter filterWithArguments:baseRequestTail];
    
    // 拼接尾部公共参数
    [config addUrlFilter:filter];
    
    
    return YES;
}

@end
