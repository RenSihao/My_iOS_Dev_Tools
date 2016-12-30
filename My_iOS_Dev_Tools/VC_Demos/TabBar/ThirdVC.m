//
//  ThirdVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC ()

@end

@implementation ThirdVC

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
    
    self.title = @"Third";
    
    // 1、线性布局 垂直或者水平
    MyLinearLayout *superView = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    superView.gravity = MyMarginGravity_Horz_Center;
    superView.myTopMargin = 20;
    superView.myLeftMargin = superView.myRightMargin = 0;
    superView.myWidth = kScreenWidth - 40;
    superView.subviewMargin = 20;
    
    UIView *a = [UIView new];
    a.myLeftMargin = a.myRightMargin = 10;
    a.myHeight = 40;
    [superView addSubview:a];
    
    UIView *b = [UIView new];
    b.myLeftMargin = 20;
    b.myWidth = b.myHeight = 40;
    [superView addSubview:b];
    
    UIView *c = [UIView new];
    c.myRightMargin = 20;
    c.myWidth = c.myHeight = 40;
    [superView addSubview:c];
    
    UIView *d = [UIView new];
    d.myLeftMargin = d.myRightMargin = 20;
    d.myHeight = 40;
    [superView addSubview:d];
    
    [self.view addSubview:superView];
    superView.backgroundColor = [UIColor grayColor];
    a.backgroundColor = [UIColor redColor];
    b.backgroundColor = [UIColor greenColor];
    c.backgroundColor = [UIColor blackColor];
    d.backgroundColor = [UIColor blueColor];
    
    LxDBAnyVar(self.view.frame);
}





















@end



