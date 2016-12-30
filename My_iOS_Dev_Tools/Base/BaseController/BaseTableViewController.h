//
//  BaseTableViewController.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseViewController.h"

// vender
#import "MJRefresh.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface BaseTableViewController : BaseViewController

@property (nonatomic, strong) UITableView *tableView;

// 默认 UITableViewStylePlain
@property (nonatomic, assign) UITableViewStyle style;

// 是否具有下拉刷新功能，默认YES
@property (nonatomic, assign) BOOL enablePullDown;

// 是否具有上拉加载功能，默认NO
@property (nonatomic, assign) BOOL enablePullUp;

// 下拉刷新，子类重写即可
- (void)beginPullDownRefresh;

// 上拉加载，子类重写即可
- (void)beginPullUpLoadMore;



@end
