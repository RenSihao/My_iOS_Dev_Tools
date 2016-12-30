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
    if (self == [BaseViewController class]) {
    }
}

#pragma mark - init

//代码初始化
- (instancetype)init
{
    if (self = [super init]){
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]){
    }
    return self;
}
//xib或者归档初始化
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
    }
    return self;
}
- (void)dealloc
{
    //NSLog(@"%s", __func__);
    [self removeNotificationObservers];
    [self removeSVP];
}

#pragma mark - life cycle

//触发前提：代码初始化方式
//通常第一次访问到view时会走此方法，目的：生成controller的view (即我们所谓的self.view就是这里生成的)
- (void)loadView
{
    //系统帮我们生成view (0,20,width,height)
    [super loadView];
    
    //或者我们自己生成 (很少这样做)
    //self.view = ...
}
//初始化时一些数据的设置
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1、添加通知
    [self addNotificationObservers];
    
    //2、加载UI控件
    self.view.backgroundColor = AppHexColor(BaseViewColor);
    
    //3、设置数据
}
//view 即将出现（每次view出现的时候都会调用）
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
//初始化的时候，默认什么也不做。当view（包括subViews）的bounds发生变化的时候会调用，可以用来布局(Tip:此方法之后回调用updateViewConstraints)
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}
//初始化的时候，默认什么也不做。注意当view（包括subViews）的bounds发生变化的时候会调用，可以用来布局。这里是bounds而不是frame。经过测试view的frame的size 发生变化才会调用该方法，而origin变化时不会调用
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //使用AutoLayout布局，一般来说下写在这个方法内是最佳选择...
}
//view已经全部展现出来(每次view出现的时候都会调用)
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
//页面即将消失的时候调用（每次view即将消失的时候，都会调用）
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
//页面已经消失的时候调用，(每次页面消失的时候都会调用)
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //此时需要将持有的对象置nil来释放内存...
}

#pragma mark - 触发事件

/**
 *  返回（自动处理pop还是dismiss）
 */
- (void)goBack:(id)sender
{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - dealloc移除视图

- (void)removeSVP
{
    // 批量销毁
    [SVProgressHUD popActivity];
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
