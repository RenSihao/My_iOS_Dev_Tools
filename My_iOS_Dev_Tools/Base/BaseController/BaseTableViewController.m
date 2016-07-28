//
//  BaseTableViewController.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

/**
 *  默认样式：系统palin风格
 */
@property (nonatomic, assign) BaseTableViewStyle style;

@end

@implementation BaseTableViewController

//.m文件同时重写set和get，需要@synthesize声明，否则语法报错
@synthesize enableScroll   = _enableScroll;
@synthesize enablePullDown = _enablePullDown;
@synthesize enablePullUp   = _enablePullUp;

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        return [self initWithStyle:BaseTableViewStyleSystemPlain];
    }
    return self;
}
- (instancetype)initWithStyle:(BaseTableViewStyle)style
{
    if (self = [super init])
    {
        //...
        self.style = style;
        
    }
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //使用AutoLayout布局，一般来说下写在这个方法内是最佳选择...
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //此时需要将持有的对象置nil来释放内存...
}
- (void)dealloc
{
    
}


#pragma mark - 初始化tableView的基本属性以及设置

- (void)initialize
{
    [super initialize];
    
}
- (void)initializeData
{
    [super initializeData];
    
}
- (void)initializeUI
{
    [super initializeUI];
    
    
}
- (void)initializeNavigationBarAndItems
{
    [super initializeNavigationBarAndItems];
    
}

#pragma mark - 下拉刷新 && 上拉加载 子类重写需调用super

- (void)beginPullDownRefresh
{
    
}
- (void)beginPullUpLoadMore
{
    
}
- (void)endPullDownRefresh
{
    typeof(self) __weak weakSelf = self;
    [self.tableView.mj_header endRefreshingWithCompletionBlock:^{
        
    }];
}
- (void)endPullUpLoadMore
{
    typeof(self) __weak weakSelf = self;
    [self.tableView.mj_footer endRefreshingWithCompletionBlock:^{
        
    }];
}

#pragma mark - setter

- (void)setEnableScroll:(BOOL)enableScroll
{
    if (self.enableScroll != enableScroll)
    {
        AppAssert(self.tableView, self, nil);
        
        self.enableScroll = enableScroll;
        
        if (self.enableScroll)
        {
            self.tableView.scrollEnabled = YES;
        }
        else
        {
            self.tableView.scrollEnabled = NO;
        }
    }
}
- (void)setEnablePullDown:(BOOL)enablePullDown
{
    if (self.enablePullDown != enablePullDown)
    {
        AppAssert(self.tableView, self, nil);
        
        self.enablePullDown = enablePullDown;
        
        if (self.enablePullDown)
        {
            typeof(self) __weak weakSelf = self;
            
            //初始化下拉刷新控件
            self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
                
                //进入刷新，执行对应方法
                [weakSelf beginPullDownRefresh];
            }];
        }
        else
        {
            [self.tableView.mj_header removeFromSuperview];
        }
        
    }
}
- (void)setEnablePullUp:(BOOL)enablePullUp
{
    if (self.enablePullUp != enablePullUp)
    {
        AppAssert(self.tableView, self, nil);
        
        self.enablePullUp = enablePullUp;
        
        if (self.enablePullUp)
        {
            typeof(self) __weak weakSelf = self;
            
            //初始化上拉加载控件
            self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
                
                //进入加载，执行对应方法
                [weakSelf beginPullUpLoadMore];
            }];
        }
        else
        {
            [self.tableView.mj_footer removeFromSuperview];
        }
    }
}

#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView)
    {
        CGRect frame = (CGRect)
        {CGPointMake(0, 0),
        CGSizeMake(self.contentWidth, self.contentHeight)};
        
        _tableView = [[UITableView alloc] initWithFrame:frame];
        
        
        
    }
    return _tableView;
}
- (BaseTableViewStyle)style
{
    if (!_style)
    {
        _style = BaseTableViewStyleSystemPlain;
    }
    return _style;
}
- (BOOL)enableScroll
{
    if (!_enableScroll)
    {
        _enableScroll = YES;
    }
    return _enableScroll;
}
- (BOOL)enablePullDown
{
    if (!_enablePullDown)
    {
        _enablePullDown = YES;
    }
    return _enablePullDown;
}
- (BOOL)enablePullUp
{
    if (!_enablePullUp)
    {
        _enablePullUp = NO;
    }
    return _enablePullUp;
}














@end
