//
//  BaseTableViewController.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseViewController.h"
#import "MJRefresh.h"

/**
 *  tableView 风格
 */
typedef NS_ENUM(NSInteger, BaseTableViewStyle) {
    /**
     *  系统的plain样式
     */
    BaseTableViewStyleSystemPlain,
    /**
     *  系统的grouped样式
     */
    BaseTableViewStyleSystemGrouped,
    /**
     *  不同APP各自独有的样式
     */
    BaseTableViewStyleBaseStyle
};

@interface BaseTableViewController : BaseViewController

/**
 *  默认
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  能否滑动，默认YES
 */
@property (nonatomic, assign) BOOL enableScroll;
/**
 *  是否具有下拉刷新功能，默认YES
 */
@property (nonatomic, assign) BOOL enablePullDown;
/**
 *  是否具有上拉加载功能，默认NO
 */
@property (nonatomic, assign) BOOL enablePullUp;


/**
 *  接口1：唯一对外初始化方法
 *
 *  @param style BaseTableViewStyle
 *
 *  @return BaseTableViewController
 */
- (instancetype)initWithStyle:(BaseTableViewStyle)style;

#pragma mark - 下拉刷新 && 上拉加载

- (void)beginPullDownRefresh;
- (void)beginPullUpLoadMore;
- (void)endPullDownRefresh;
- (void)endPullUpLoadMore;



@end
