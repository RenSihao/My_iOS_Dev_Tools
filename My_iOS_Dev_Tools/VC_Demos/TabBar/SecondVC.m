//
//  SecondVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "SecondVC.h"
#import "UIImage+Category.h"
#import <JKCategories/JKCategories.h>
#import "QQZonePopMenuView.h"

@interface SecondVC ()

// 示例图片
@property (nonatomic, strong) UIImageView *iv;

//
@property (nonatomic, strong) NSMutableArray *labs;
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) UIButton *originBtn;

// 四个方向参数的比例系数 从 0 ~ 1
@property (nonatomic, assign) CGFloat topCap;
@property (nonatomic, assign) CGFloat leftCap;
@property (nonatomic, assign) CGFloat bottomCap;
@property (nonatomic, assign) CGFloat rightCap;
@end

@implementation SecondVC

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
    
    self.title = @"Second";
    
    UIImage *nine = [UIImage imageNamed:@"nine"];
    
    self.iv = [[UIImageView alloc] initWithImage:nine];
    self.iv.backgroundColor = [UIColor grayColor];
//    iv.contentMode = UIViewContentModeScaleAspectFit;
//    iv.layer.masksToBounds = YES;
    
    [self.view addSubview:self.iv];
    [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(50);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(120);
    }];
    
    // 重置按钮
    self.originBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.originBtn.backgroundColor = [UIColor redColor];
    self.originBtn.layer.cornerRadius = 15;
    self.originBtn.layer.masksToBounds = YES;
    [self.originBtn addTarget:self action:@selector(resert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.originBtn];
    [self.originBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(10);
        make.centerX.mas_equalTo(self.view);
        make.width.height.mas_equalTo(30);
    }];
    
    
    // 添加 labs && btns
    [self setLabAndBtn];
}
- (void)resert
{
    self.iv.image = [UIImage imageNamed:@"nine"];
    self.topCap = 0;
    self.leftCap = 0;
    self.bottomCap = 0;
    self.rightCap = 0;
    
}

- (void)setLabAndBtn
{
    self.labs = [NSMutableArray new];
    
    CGFloat width = (kScreenWidth - 20*2 - 10*3) / 4.f;
    for (int i=1; i<=4; i++) {
        
        UILabel *lab = [UILabel new];
        lab.tag = i;
        lab.backgroundColor = [UIColor orangeColor];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.numberOfLines = 0;
        switch (i) {
            case 1:
            {
                lab.text = @"top";
            }
                break;
            case 2:
            {
                lab.text = @"left";
            }
                break;
            case 3:
            {
                lab.text = @"bottom";
            }
                break;
            case 4:
            {
                lab.text = @"right";
            }
                break;
            default:
                break;
        }
        
        [self.labs addObject:lab];
        [self.view addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iv.mas_bottom).offset(20);
            make.left.mas_equalTo(self.view).offset(20+(width+10)*(i-1));
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(50);
        }];
        
        UIButton *addBtn = [UIButton new];
        addBtn.tag = i;
        addBtn.backgroundColor = [UIColor grayColor];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [addBtn setTitle:@"+" forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(lab.mas_bottom).offset(10);
            make.left.width.height.mas_equalTo(lab);
        }];
        
        UIButton *reduceBtn = [UIButton new];
        reduceBtn.tag = -i;
        reduceBtn.backgroundColor = [UIColor grayColor];
        reduceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [reduceBtn setTitle:@"-" forState:UIControlStateNormal];
        [reduceBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:reduceBtn];
        [reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(addBtn.mas_bottom).offset(10);
            make.left.width.height.mas_equalTo(lab);
        }];
        
    }
}

- (void)clickBtn:(UIButton *)sender
{
//    if (self.topCap >= 1 ||
//        self.leftCap >=1  ||
//        self.bottomCap >= 1 ||
//        self.rightCap >= 1) {
//        NSLog(@"fuck 超过比例系数1了");
//        return ;
//    }
    
    // 待处理的图片
    UIImage *nine = [UIImage imageNamed:@"nine"];
    
    // 取出对应lab
    UILabel *lab = nil;
    for (UILabel *obj in self.labs) {
        if ((abs(sender.tag)) == obj.tag) {
            lab = obj;
        }
        
    }
    
    // 修改对应拉伸参数
    switch (sender.tag) {
        case -1:
        {
            self.topCap -= 0.1;
            lab.text = [NSString stringWithFormat:@"top\n%.1lf", self.topCap];
        }
            break;
        case -2:
        {
            self.leftCap -= 0.1;
            lab.text = [NSString stringWithFormat:@"left\n%.1lf", self.leftCap];
        }
            break;
        case -3:
        {
            self.bottomCap -= 0.1;
            lab.text = [NSString stringWithFormat:@"bottom\n%.1lf", self.bottomCap];
        }
            break;
        case -4:
        {
            self.rightCap -= 0.1;
            lab.text = [NSString stringWithFormat:@"right\n%.1lf", self.rightCap];
        }
            break;
        case 1:
        {
            self.topCap += 0.1;
            lab.text = [NSString stringWithFormat:@"top\n%.1lf", self.topCap];
        }
            break;
        case 2:
        {
            self.leftCap += 0.1;
            lab.text = [NSString stringWithFormat:@"left\n%.1lf", self.leftCap];
        }
            break;
        case 3:
        {
            self.bottomCap += 0.1;
            lab.text = [NSString stringWithFormat:@"bottom\n%.1lf", self.bottomCap];
        }
            break;
        case 4:
        {
            self.rightCap += 0.1;
            lab.text = [NSString stringWithFormat:@"right\n%.1lf", self.rightCap];
        }
            break;
        default:
            break;
    }
    
    
    // 开始拉伸
    nine = [nine stretchableImageWithEdgeInset:UIEdgeInsetsMake(self.topCap * nine.size.height,
                                                                self.leftCap * nine.size.width,
                                                                self.bottomCap * nine.size.height,
                                                                self.rightCap * nine.size.width)];
    
    self.iv.image = nine;
    
    [QQZonePopMenuView showFromView:sender titles:@[@"0", @"1", @"2"]];
}

@end








