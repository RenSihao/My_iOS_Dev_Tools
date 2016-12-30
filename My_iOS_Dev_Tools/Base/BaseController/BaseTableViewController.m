//
//  BaseTableViewController.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

@end

@implementation BaseTableViewController

//.m文件同时重写set和get，需要@synthesize声明，否则语法报错
@synthesize enablePullDown = _enablePullDown;
@synthesize enablePullUp   = _enablePullUp;
@synthesize style          = _style;

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]){
        
        /* 基类tableview属性设置 子类继承可直接自行修改 */
        
        // plain风格
        _style = UITableViewStylePlain;
        
        // 下拉刷新
        _enablePullDown = YES;
        
        // 上拉加载 
        _enablePullUp = NO;
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]){
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
    }
    return self;
}
- (void)dealloc
{
    //NSLog(@"%s", __func__);
}

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1、 add tableView
    [self.view addSubview:self.tableView];
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
}

#pragma mark - setter (Public methods)

- (void)setEnablePullDown:(BOOL)enablePullDown
{
    if (_enablePullDown == enablePullDown) {
        return ;
    }
    
    AppAssert(self.tableView, self, nil);
    _enablePullDown = enablePullDown;
    if (_enablePullDown) {
        self.tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginPullDownRefresh)];
    } else {
        self.tableView.mj_header = nil;
    }
}
- (void)setEnablePullUp:(BOOL)enablePullUp
{
    if (_enablePullUp == enablePullUp) {
        return ;
    }
    
    AppAssert(self.tableView, self, nil);
    _enablePullUp = enablePullUp;
    if (_enablePullUp) {
        self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(beginPullUpLoadMore)];
    } else {
        self.tableView.mj_footer = nil;
    }
}
- (void)beginPullDownRefresh
{
}
- (void)beginPullUpLoadMore
{
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return AppTableViewClearHeaderView();
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return AppTableViewClearFooterView();
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell identifier]];
    return cell;
}


#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, self.contentWidth, self.contentHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame style:_style];
        
        // 基类tableview背景色
        _tableView.backgroundColor = AppHexColor(BaseTableViewColor);
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        
        // empty view
        _tableView.emptyDataSetSource   = self;
        _tableView.emptyDataSetDelegate = self;
        
        // 分割线风格
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        // 下面两句代码没什么用，还是得靠具体cell自己设置 separatorInset 和 layoutMargins
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins  = UIEdgeInsetsZero;
        
        // register cell
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:[UITableViewCell identifier]];
        
    }
    return _tableView;
}














@end
