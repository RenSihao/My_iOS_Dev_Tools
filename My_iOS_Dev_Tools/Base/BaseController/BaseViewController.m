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
    //Method Swizzle...
    
}
+ (void)initialize
{
    //确保父类方法只执行一次
    if (self == [BaseViewController class])
    {
        //...
        
    }
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1、添加通知
    [self addNotificationObservers];
    
    //2、初始化基本属性
    [self initialize];
    
    //3、初始化数据
    [self initializeData];
    
    //4、初始化UI
    [self initializeUI];
    
    //5、初始化NavBar
    [self initializeNavigationBarAndItems];
    
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
    [self removeNotificationObservers];
}

#pragma mark - 初始化基本属性

/**
 *  初始化基本属性（非数据、非UI的东西，例如某些功能属性的设置...）
 */
- (void)initialize
{
    self.view.backgroundColor = AppHexColor(BaseViewColor);
    
    
}
/**
 *  初始化数据
 */
- (void)initializeData
{
    
}
/**
 *  初始化UI（可以用来添加所有子控件）
 */
- (void)initializeUI
{
    
}
/**
 *  初始化NavigationBar以及items相关属性，子类重写必须调用super
 */
- (void)initializeNavigationBarAndItems
{
    if (self.navigationController.viewControllers.count > 1)
    {
        //定义全局返回按钮...
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"Back-.-" style:UIBarButtonItemStyleDone target:self action:@selector(goBack:)];
        
        self.navigationItem.leftBarButtonItem = leftItem;
    }
}

#pragma mark - 触发事件

/**
 *  返回（自动处理pop还是dismiss）
 */
- (void)goBack:(id)sender
{
    if (self.navigationController.viewControllers.count > 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

#pragma mark - 通知相关

/**
 *  添加通知，子类重写即可
 */
- (void)addNotificationObservers
{
    
}
/**
 *  移除通知，子类重写即可
 */
- (void)removeNotificationObservers
{
    
}


#pragma mark - StatusBar

/**
 *  使用这两个方法手动管理状态栏，切记不能在 info.plist 文件中添加 View controller-based status bar appearance
 *  tip：程序启动的时候，需要隐藏状态栏，有两种方法
 *      1、info.plist 文件中修改 Status bar is initially hidden 为 YES
 *      2、修改 Targets -> General -> Hide status bar
 */
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

































@end
