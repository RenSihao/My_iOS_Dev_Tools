//
//  FourthVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "FourthVC.h"
#import "EncryptVC.h"
#import "RSA.h"

@interface FourthVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation FourthVC

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
    
    self.title = @"Fourth";
    
    [self.view addSubview:self.tableView];
    
    NSString *str = @"hello";
    
    //公钥文件加密
    NSString *encryptStr = [RSA encryptString:str
                  publicKeyWithContentsOfFile:LocalFilePath(@"public_key.der")];
    LxDBAnyVar(encryptStr);
    
    //私钥文件解密
    NSString *decryptStr = [RSA decryptString:encryptStr
                 privateKeyWithContentsOfFile:LocalFilePath(@"private_key.p12")
                                     password:RSAPrivateKeyPassword];
    LxDBAnyVar(decryptStr);
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeselectTableView(tableView, indexPath);
    
    if (indexPath.row == 0) {
        EncryptVC *vc = [EncryptVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.titles objectOrNilAtIndex:indexPath.row];
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
        _titles = @[@"各种类型加密解密demo"];
    }
    return _titles;
}

@end
