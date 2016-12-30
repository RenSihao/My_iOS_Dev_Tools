//
//  QQZonePopMenuView.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/16.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "QQZonePopMenuView.h"

static CGFloat QQZonePopMenuCellHeight = 44.f; // 单个cell固定高度
static CGFloat QQZonePopMenuBgAlpha = 0.3;     // 背景透明度
static CGFloat QQZonePopShowAnimationTimeInterval = 0.25;   // 弹出动画持续时间
static CGFloat QQZonePopDismissAnimationTimeInterval = 0.25; // 隐藏动画持续时间

@interface QQZonePopMenuView ()
<
UITableViewDelegate,
UITableViewDataSource,
UIGestureRecognizerDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@property (nonatomic, assign) CGRect fromViewRect;
@property (nonatomic, assign) CGRect toViewRect;
@end

@implementation QQZonePopMenuView

+ (instancetype)sharedInstance
{
    static QQZonePopMenuView *view;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        view = [[QQZonePopMenuView alloc] init];
    });
    return view;
}
- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        // alpha 0~1 完全透明~完全不透明
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:QQZonePopMenuBgAlpha];
    }
    return self;
}
+ (void)showFromView:(UIView *)from titles:(NSArray *)titles
{
    [[self sharedInstance] showFromView:from titles:titles];
}
- (void)showFromView:(UIView *)from titles:(NSArray *)titles
{
    self.titles = titles.count > 0 ? titles : @[@"default title"];
    
    
    // 转换坐标系 view -> window 根据 from在自己的父控件里的frame 算出 在window里的frame
    self.fromViewRect = from.frame;
    self.toViewRect   = [from.superview convertRect:from.frame toView:nil];
    if (![self.window.subviews containsObject:self]) {
        
        // self 设置属性
        [self.tableView reloadData];
        [self addSubview:self.tableView];
        
        self.tableView.frame = CGRectMake(self.toViewRect.origin.x,
                                          self.toViewRect.origin.y,
                                          0,
                                          0);
        // 添加动画
        [UIView animateWithDuration:QQZonePopShowAnimationTimeInterval delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0 alpha:QQZonePopMenuBgAlpha];
            self.tableView.frame = CGRectMake(self.toViewRect.origin.x,
                                              self.toViewRect.origin.y,
                                              kScreenWidth-40,
                                              QQZonePopMenuCellHeight*self.titles.count);
        } completion:^(BOOL finished) {
            
        }];
        
        // window 添加 popview
        [self.window addSubview:self];
        
    } else {
        NSLog(@"xx");
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint p = [gestureRecognizer locationInView:self.tableView];
    
    if (CGRectContainsPoint(self.frame, p)) {
        // 父视图的手势响应事件，禁止子视图也去响应
        return NO;
    } else {
        return YES;
    }
}

#pragma mark - dismiss

- (void)dismiss:(UITapGestureRecognizer *)tap
{
    if (tap.view == self.tableView) {
        return ;
    }
    
    if ([self.window.subviews containsObject:self]) {
        [UIView animateWithDuration:QQZonePopDismissAnimationTimeInterval animations:^{
            self.tableView.frame = CGRectMake(self.toViewRect.origin.x,
                                              self.toViewRect.origin.y,
                                              0,
                                              0);
            self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        } completion:^(BOOL finished) {
            [self.tableView removeFromSuperview];
            [self removeFromSuperview];
        }];
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return QQZonePopMenuCellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeselectTableView(tableView, indexPath);
    NSLog(@"%ld", indexPath.row);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.titles.count) {
        return 1;
    } else {
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.textLabel.text = [self.titles objectOrNilAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = AppTableViewClearHeaderView();
        _tableView.tableFooterView = AppTableViewClearFooterView();
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}
- (NSArray<NSString *> *)titles
{
    if (!_titles) {
        _titles = [NSArray new];
    }
    return _titles;
}
- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIApplication sharedApplication].windows lastObject];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        tap.delegate = self;
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [_window addGestureRecognizer:tap];
    }
    return _window;
}


@end
