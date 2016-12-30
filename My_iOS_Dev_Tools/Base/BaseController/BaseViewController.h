//
//  BaseViewController.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

// vender
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

// category
#import "UITableViewCell+Category.h"
#import "UIViewController+Frame.h"
#import "UIViewController+SVP.h"

@interface BaseViewController : UIViewController


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
