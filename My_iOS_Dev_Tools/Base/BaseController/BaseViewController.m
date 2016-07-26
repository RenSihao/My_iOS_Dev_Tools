//
//  BaseViewController.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

+ (void)load
{
    NSLog(@"%s", __func__);
}
+ (void)initialize
{
    NSLog(@"%s", __func__);
}

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        
    }
    return self;
}

#pragma mark - life cycle

- (void)loadView
{
    
}

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
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}


#pragma mark - 初始化基本属性

- (void)





































@end
