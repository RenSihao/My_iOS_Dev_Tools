//
//  BaseViewController.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


#pragma mark - 基类对外方法，子类重写需要调用super

/**
 *  初始化基本属性（非数据、非UI的东西，例如某些功能属性的设置...）
 */
- (void)initialize;

/**
 *  初始化数据
 */
- (void)initializeData;

/**
 *  初始化UI（可以用来添加所有子控件）
 */
- (void)initializeUI;

/**
 *  初始化NavigationBar以及items相关属性
 */
- (void)initializeNavigationBarAndItems;

#pragma mark - 通知相关

/**
 *  添加通知，子类重写即可
 */
- (void)addNotificationObservers;

/**
 *  移除通知，子类重写即可
 */
- (void)removeNotificationObservers;
    


@end
