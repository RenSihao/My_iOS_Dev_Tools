//
//  EncryptVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/28.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "EncryptVC.h"

@interface EncryptVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

// 对称性加密算法
@property (nonatomic, strong) NSArray *symmetricTitles;

//非对称性加密算法
@property (nonatomic, strong) NSArray *unSymmetricTitles;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation EncryptVC

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"%s", __func__);
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"加密&解密";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeselectTableView(tableView, indexPath);
}

#pragma makr - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titles.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *titles = [self.titles objectOrNilAtIndex:section];
    return titles.count;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = nil;
    if (section == 0) {
        title = @"对称性算法";
    } else {
        title = @"非对称性算法";
    }
    return title;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.symmetricTitles objectOrNilAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.unSymmetricTitles objectOrNilAtIndex:indexPath.row];
    }
    return cell;
}

#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-BaseTabBarHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.tableHeaderView = [UIView new];
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}
- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[self.symmetricTitles,
                    self.unSymmetricTitles];
    }
    return _titles;
}
- (NSArray *)symmetricTitles
{
    if (!_symmetricTitles) {
        _symmetricTitles = @[@"3DES", @"AES"];
    }
    return _symmetricTitles;
}
- (NSArray *)unSymmetricTitles
{
    if (!_unSymmetricTitles) {
        _unSymmetricTitles = @[@"RSA"];
    }
    return _unSymmetricTitles;
}





@end


