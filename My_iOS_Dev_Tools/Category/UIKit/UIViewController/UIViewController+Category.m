//
//  UIViewController+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>


/**objc rutime 属性，key **/

/**状态栏隐藏
 */
static char SeastatusBarHiddenKey;

/**是否网络加载指示器
 */
static char SeaShowNetworkActivityKey;

/**网络加载指示器
 */
static char SeaNetworkActivityViewKey;

/**是否网络请求
 */
static char SeaRequestingKey;

/**是否正在全屏加载
 */
static char SeaLoadingKey;

/**全屏加载视图
 */
static char SeaLoadingIndicatorKey;

/**没有数据
 */
static char SeaHasNoMsgViewkey;

/**按钮标题颜色
 */
static char SeaIconTintColorKey;

/**重新加载视图
 */
static char SeaBadNetworkRemindViewKey;

/**提示信息框
 */
static char SeaPromptViewKey;

/**自定义tabBar
 */
static char Sea_TabBarControllerKey;

/**是否隐藏
 */
static char SeaHideTabBarKey;


@implementation UIViewController (Category)

-(void)showTextHud:(NSString*)message
{
    [self showtextHUDWith:message andDelay:2.0];
}

- (void)showTextHudNoTab:(NSString *)message{
    [self showtextHUDWith:message andDelay:2.0];
}

- (void)showTextHud:(NSString *)message delay:(int)delay{
    [self showtextHUDWith:message andDelay:delay];
}

-(void)showIndeterminateHud:(NSString *)text delay:(int)delay{
    [self showHUD];
    self.view.userInteractionEnabled = NO;;
}

- (void)showHUD{
//    SeaNetworkActivityView *seaNet = [[SeaNetworkActivityView alloc] init];
//    [self.view addSubview:seaNet];
//    [self.view bringSubviewToFront:seaNet];
}

- (void)showtextHUDWith:(NSString *)msg andDelay:(int)delay{
//    SeaPromptView *alertView = [[SeaPromptView alloc] initWithFrame:CGRectMake((self.view.width - SeaPromptViewWidth) / 2.0, (self.contentHeight - SeaPromptViewHeight) / 2.0, SeaPromptViewWidth, SeaPromptViewHeight) message:msg];
//    [self.view addSubview:alertView];
//    alertView.removeFromSuperViewAfterHidden = NO;
//    alertView.messageLabel.text = msg;
//    [self.view bringSubviewToFront:alertView];
//    [alertView showAndHideDelay:delay];
}

- (void)hideHud{
//    for (UIView *view in self.view.subviews) {
//        if ([view isKindOfClass:[SeaNetworkActivityView class]]) {
//            [view removeFromSuperview];
//        }
//        else if ([view isKindOfClass:[SeaPromptView class]]){
//            [view removeFromSuperview];
//        }
//    }
//    self.view.userInteractionEnabled = YES;
}

- (void)showSeaAlertViewWithDelegate:(id)delegate andMessage:(NSString *)str isWithCancelButton:(BOOL)isWithCancel{
//    NSArray *buttonTitleArr;
//    if (isWithCancel) {
//        buttonTitleArr = @[@"取消",@"确定"];
//    }
//    else{
//        buttonTitleArr = @[@"确定"];
//    }
//    SeaAlertView *alert = [[SeaAlertView alloc] initWithTitle:str otherButtonTitles:buttonTitleArr];
//    alert.delegate = delegate;
//    if (isWithCancel) {
//        [alert setButtonTitleColor:kDefaultColor forIndex:1];
//    }
//    else{
//        [alert setButtonTitleColor:kDefaultColor forIndex:0];
//    }
//    [alert show];
}

- (void)disMissAlertView{
//    for (UIView *view in self.view.subviews) {
//        if ([view isKindOfClass:[SeaAlertView class]]) {
//            [(SeaAlertView *)view dismiss];
//        }
//    }
}



/**显示没有数据时的视图
 *@param hiden 是否显示
 *@param msg 提示的信息
 */
- (void)setHasNoMsgViewHidden:(BOOL) hidden msg:(NSString*) msg
{
//    if(!hidden && !self.hasNoMsgView)
//    {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _width_, self.contentHeight)];
//        label.backgroundColor = self.view.backgroundColor;
//        label.font = [UIFont fontWithName:MainFontName size:18.0];
//        label.textColor = [UIColor grayColor];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.numberOfLines = 0;
//        [self.view addSubview:label];
//        self.hasNoMsgView = label;
//    }
//    
//    if([self.hasNoMsgView isKindOfClass:[UILabel class]])
//    {
//        UILabel *label = (UILabel*)self.hasNoMsgView;
//        label.text = msg;
//    }
//    
//    self.hasNoMsgView.hidden = hidden;
//    if(!hidden && self.hasNoMsgView)
//    {
//        [self.view bringSubviewToFront:self.hasNoMsgView];
//    }
}

/**设置没有信息时的视图
 */
- (void)setHasNoMsgView:(UIView *)hasNoMsgView
{
//    objc_setAssociatedObject(self, &SeaHasNoMsgViewkey, hasNoMsgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//- (UIView*)hasNoMsgView
//{
////    return objc_getAssociatedObject(self, &SeaHasNoMsgViewkey);
//}


#pragma mark - readonly property

- (CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (CGFloat)navigationBarHeight
{
    if (self.navigationController.navigationBarHidden)
    {
        return 0.f;
    }
    else
    {
        return BaseNavBarHeight;
    }
}
- (CGFloat)tabBarHeight
{
    if (self.tabBarController.tabBar.isHidden)
    {
        return 0.f;
    }
    else
    {
        return BaseTabBarHeight;
    }
}












#pragma mark- back

//返回方法
- (void)back
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

//长按返回第一个视图
- (void)longPressBack:(UILongPressGestureRecognizer*) longPress
{
    if(longPress.state == UIGestureRecognizerStateBegan)
    {
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

//dismss
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark- navigation

///**获取导航栏按钮 标题和图标只需设置一个
// *@param title 标题
// *@param icon 按钮图标
// *@param action 按钮点击方法
// *@return ios7以上 UIBarButtonItem, ios7以下 NSArray ,数组元素是 UIBarButtonItem
// */
//- (id)barButtonItemWithTitle:(NSString*) title icon:(UIImage*) icon action:(SEL) action
//{
////    return [[self class] barButtonItemWithTitle:title icon:icon target:self action:action tintColor:self.iconTintColor];
//}
//
///**获取系统导航栏按钮
// *@param style 系统barButtonItem 样式
// *@param action 按钮点击方法
// *@return 一个根据style 初始化的 UIBarButtonItem 对象，颜色是 iconTintColor
// */
//- (UIBarButtonItem*)systemBarButtonItemWithStyle:(UIBarButtonSystemItem) style action:(SEL) action
//{
////    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:style target:self action:action];
////    item.tintColor = self.iconTintColor;
////    return item;
//}

/**获取自定义按钮的导航栏按钮
 *@param type 自定义按钮类型
 *@param action 按钮点击方法
 *@return 一个初始化的 UIBarButtonItem
 */
//- (UIBarButtonItem*)itemWithButtonWithType:(SeaButtonType) type action:(SEL) action
//{
////    SeaButton *button = [[SeaButton alloc] initWithFrame:CGRectMake(0, 0, 25, 35) buttonType:type];
////    button.lineColor = self.iconTintColor;
////    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
////    
////    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
////    
////    return item;
//}
//
///**设置导航条左边按钮 标题和图标只需设置一个
// *@param title 标题
// *@param icon 按钮图标
// *@param action 按钮点击方法
// *@param position 按钮位置
// */
//- (void)setBarItemsWithTitle:(NSString*) title icon:(UIImage*) icon action:(SEL) action position:(SeaNavigationItemPosition) position
//{
////    id item = [self barButtonItemWithTitle:title icon:icon action:action];
////    if([item isKindOfClass:[UIBarButtonItem class]])
////    {
////        switch (position)
////        {
////            case SeaNavigationItemPositionLeft :
////            {
////                self.navigationItem.leftBarButtonItem = item;
////            }
////                break;
////            case SeaNavigationItemPositionRight :
////            {
////                self.navigationItem.rightBarButtonItem = item;
////            }
////                break;
////            default:
////                break;
////        }
////    }
////    else if([item isKindOfClass:[NSArray class]])
////    {
////        switch (position)
////        {
////            case SeaNavigationItemPositionLeft :
////            {
////                self.navigationItem.leftBarButtonItems = item;
////            }
////                break;
////            case SeaNavigationItemPositionRight :
////            {
////                self.navigationItem.rightBarButtonItems = item;
////            }
////                break;
////            default:
////                break;
////        }
////    }
//}
//
///**通过系统barButtonItem 设置导航条左边按钮
// *@param style 系统barButtonItem 样式
// *@param action 按钮点击方法
// *@param position 按钮位置
// */
//- (void)setBarItemsWithStyle:(UIBarButtonSystemItem) style action:(SEL) action position:(SeaNavigationItemPosition) position
//{
//    switch (position)
//    {
//        case SeaNavigationItemPositionLeft :
//        {
//            self.navigationItem.leftBarButtonItem = [self systemBarButtonItemWithStyle:style action:action];
//        }
//            break;
//        case SeaNavigationItemPositionRight :
//        {
//            self.navigationItem.rightBarButtonItem = [self systemBarButtonItemWithStyle:style action:action];
//        }
//            break;
//        default:
//            break;
//    }
//}
//
///**通过自定的按钮类型 设置导航条左边按钮
// *@param buttonType 自定义按钮类型
// *@param action 按钮点击方法
// *@param position 按钮位置
// */
//- (void)setBarItemWithButtonType:(SeaButtonType) buttonType action:(SEL) action position:(SeaNavigationItemPosition) position
//{
//    switch (position)
//    {
//        case SeaNavigationItemPositionLeft :
//        {
//            self.navigationItem.leftBarButtonItem = [self itemWithButtonWithType:buttonType action:action];
//        }
//            break;
//        case SeaNavigationItemPositionRight :
//        {
//            self.navigationItem.rightBarButtonItem = [self itemWithButtonWithType:buttonType action:action];
//        }
//            break;
//        default:
//            break;
//    }
//}
//
///**通过自定义视图 设置导航条右边按钮
// *@param customView 自定义视图
// */
//- (void)setBarItemWithCustomView:(UIView*) customView position:(SeaNavigationItemPosition) position
//{
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customView];
//    
//    switch (position)
//    {
//        case SeaNavigationItemPositionLeft :
//        {
//            self.navigationItem.leftBarButtonItem = item;
//        }
//            break;
//        case SeaNavigationItemPositionRight :
//        {
//            self.navigationItem.rightBarButtonItem = item;
//        }
//            break;
//        default:
//            break;
//    }
//}
//
///**设置dismiss 按钮
// *@param position 按钮位置
// */
//- (void)setDismissBarItemWithPosition:(SeaNavigationItemPosition) position
//{
//    SeaButton *button = [[SeaButton alloc] initWithFrame:CGRectMake(0, 0, 25, 35) buttonType:SeaButtonTypeClose];
//    button.lineColor = self.iconTintColor;
//    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
//    
//    switch (position)
//    {
//        case SeaNavigationItemPositionLeft :
//            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//            break;
//        case SeaNavigationItemPositionRight :
//            [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//            break;
//        default:
//            break;
//    }
//    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
//    
//    switch (position)
//    {
//        case SeaNavigationItemPositionLeft :
//        {
//            self.navigationItem.leftBarButtonItem = item;
//        }
//            break;
//        case SeaNavigationItemPositionRight :
//        {
//            self.navigationItem.rightBarButtonItem = item;
//        }
//            break;
//        default:
//            break;
//    }
//}
//
///**设置导航条样式 默认不透明
// *@param backgroundColor 背景颜色
// *@param titleColor 标题颜色
// *@param font 标题字体
// */
//- (void)setupNavigationBarWithBackgroundColor:(UIColor*) backgroundColor titleColor:(UIColor*) titleColor titleFont:(UIFont*) font
//{
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    [UIViewController setupNavigationBar:navigationBar withBackgroundColor:backgroundColor titleColor:titleColor titleFont:font];
//}
//
//- (void)setupDefaultNavigationBar
//{
//    //设置默认导航条
//    UINavigationBar *navigationBar = self.navigationController.navigationBar;
//    
//    NSDictionary *dic = nil;
//    
//    
//    dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:MainFontName size:20.0], NSFontAttributeName, nil];
//    
//    
//    // navigationBar.translucent = NO;
//    UIColor *color = _navigationBarBackgroundColor_;
//    
//    navigationBar.barTintColor = color;
//    
//    navigationBar.tintColor = [UIColor blackColor];
//    
//    [navigationBar setTitleTextAttributes:dic];
//}
//
//#pragma mark- 显示
//
///**通过添加navigationBar展现
// *@param viewController 用于 presentViewController:self
// *@param animated 是否动画展示
// *@param completion 视图出现完成回调
// */
//- (void)showInViewController:(UIViewController*) viewController animated:(BOOL) animated completion:(void (^)(void))completion
//{
//    SeaNavigationController *nav = [[SeaNavigationController alloc] initWithRootViewController:self];
//    
//    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    [viewController presentViewController:nav animated:animated completion:completion];
//}
//
///**直接展现 没有导航条
// *@param viewController 用于 presentViewController:self
// *@param animated 是否动画展示
// *@param completion 视图出现完成回调
// */
//- (void)showInViewControllerWithoutNavigationBar:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
//{
//    [viewController presentViewController:self animated:animated completion:completion];
//}
//
///**创建导航栏并返回 UINavigationController
// */
//- (UINavigationController*)createdInNavigationController
//{
//    SeaNavigationController *nav = [[SeaNavigationController alloc] initWithRootViewController:self];
//    return nav;
//}
//
//#pragma mark- reload data
//
///**加载数据失败
// */
//- (void)failToLoadData
//{
//    if(!self.badNetworkRemindView)
//    {
//        SeaBadNetworkRemindView *view = [[SeaBadNetworkRemindView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, [self contentHeight]) message:nil];
//        view.delegate = self;
//        [self.view addSubview:view];
//        self.badNetworkRemindView = view;
//    }
//    [self.view bringSubviewToFront:self.badNetworkRemindView];
//    self.badNetworkRemindView.hidden = NO;
//}
//
//- (void)badNetworkRemindViewDidReloadData:(SeaBadNetworkRemindView *)view
//{
//    [self.badNetworkRemindView removeFromSuperview];
//    self.badNetworkRemindView = nil;
//    self.loading = YES;
//    [self reloadDataFromNetwork];
//}
//
///**加载失败
// */
//- (void)setBadNetworkRemindView:(SeaBadNetworkRemindView *)badNetworkRemindView
//{
//    objc_setAssociatedObject(self, &SeaBadNetworkRemindViewKey, badNetworkRemindView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (SeaBadNetworkRemindView*)badNetworkRemindView
//{
//    return objc_getAssociatedObject(self, &SeaBadNetworkRemindViewKey);
//}
//
///**重新加载数据 默认不做任何事，子类可以重写该方法
// */
//- (void)reloadDataFromNetwork{};
//
//
//#pragma mark- alert
//
///**网络请求指示器信息
// *@param msg 提示的信息
// */
//- (void)setShowNetworkActivityWithMsg:(NSString*) msg
//{
//    self.showNetworkActivity = YES;
//    self.networkActivityView.msg = msg;
//}
//
///**提示信息
// *@param msg 要提示的信息
// */
//- (void)alertMsg:(NSString*) msg
//{
//    if(!self.promptView)
//    {
//        
//        SeaPromptView *alertView = [[SeaPromptView alloc] initWithFrame:CGRectMake((self.view.width - _seaAlertViewWidth_) / 2.0, (self.contentHeight - _seaAlertViewHeight_) / 2.0, _seaAlertViewWidth_, _seaAlertViewHeight_) message:msg];
//        [self.view addSubview:alertView];
//        alertView.removeFromSuperViewAfterHidden = NO;
//        self.promptView = alertView;
//    }
//    
//    self.promptView.messageLabel.text = msg;
//    [self.view bringSubviewToFront:self.promptView];
//    [self.promptView showAndHideDelay:2.0];
//}
//
////- (void)setPromptView:(SeaPromptView *)promptView
////{
////    objc_setAssociatedObject(self, &SeaPromptViewKey, promptView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
////}
//
///**提示信息
// */
////- (SeaPromptView*)promptView
////{
////    return objc_getAssociatedObject(self, &SeaPromptViewKey);
////}
//
///**网络不佳的提示信息
// *@param msg 要提示的信息
// */
//- (void)alerBadNetworkMsg:(NSString*) msg
//{
//    [self alertMsg:[NSString stringWithFormat:@"%@%@", _alertMsgWhenBadNetwork_, msg]];
//}
//
//
//#pragma mark- sea_tabBar
//
///**关联的选项卡 default is 'nil'
// */
////- (void)setSea_TabBarController:(SeaTabBarController *)Sea_TabBarController
////{
////    objc_setAssociatedObject(self, &Sea_TabBarControllerKey, Sea_TabBarController, OBJC_ASSOCIATION_ASSIGN);
////}
//
////- (SeaTabBarController*)Sea_TabBarController
////{
////    return objc_getAssociatedObject(self, &Sea_TabBarControllerKey);
////}
//
///**当viewWillAppear时是否隐藏选项卡 default is 'YES'
// */
//- (void)setHideTabBar:(BOOL)hideTabBar
//{
//    objc_setAssociatedObject(self, &SeaHideTabBarKey, [NSNumber numberWithBool:hideTabBar], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (BOOL)hideTabBar
//{
//    return [objc_getAssociatedObject(self, &SeaHideTabBarKey) boolValue];
//}
//
//#pragma mark- Class Method
//
///**获取导航栏按钮 标题和图标只需设置一个
// *@param title 标题
// *@param icon 按钮图标
// *@param target 方法执行者
// *@param action 按钮点击方法
// *@param tintColor 主题颜色
// *@return ios7以上 UIBarButtonItem, ios7以下 NSArray ,数组元素是 UIBarButtonItem
// */
//+ (id)barButtonItemWithTitle:(NSString*) title icon:(UIImage*) icon target:(id) target action:(SEL) action tintColor:(UIColor*) tintColor
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    if(action && target)
//    {
//        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//        [button setShowsTouchWhenHighlighted:YES];
//    }
//    
//    if(title)
//    {
//        button.titleLabel.font = [UIFont fontWithName:MainFontName size:15.0];
//        CGSize size = [title stringSizeWithFont:button.titleLabel.font contraintWith:CGFLOAT_MAX];
//        [button setFrame:CGRectMake(0, 0, size.width + 5.0, size.height)];
//        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
//        [button setTitle:title forState:UIControlStateNormal];
//        
//        UIColor *titleColor = tintColor;
//        if(titleColor == nil)
//            titleColor = [UIColor whiteColor];
//        
//        [button setTitleColor:titleColor forState:UIControlStateNormal];
//    }
//    else if(icon)
//    {
//        [button setImage:icon forState:UIControlStateNormal];
//        [button setFrame:CGRectMake(0, 0, icon.size.width, icon.size.height)];
//    }
//    
//    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//    
//    return backBarButtonItem;
//    
//}
//
///**设置导航条样式 默认不透明
// *@param navigationBar 要设置的导航栏
// *@param backgroundColor 背景颜色
// *@param titleColor 标题颜色
// *@param font 标题字体
// */
//+ (void)setupNavigationBar:(UINavigationBar*)navigationBar withBackgroundColor:(UIColor*) backgroundColor titleColor:(UIColor*) titleColor titleFont:(UIFont*) font
//{
//    if(backgroundColor)
//    {
//        navigationBar.barTintColor = backgroundColor;
//    }
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    
//    if(titleColor)
//    {
//        [dic setObject:titleColor forKey:NSForegroundColorAttributeName];
//    }
//    
//    if(font)
//    {
//        [dic setObject:font forKey:NSFontAttributeName];
//    }
//    
//    
//    if(dic.count > 0)
//    {
//        [navigationBar setTitleTextAttributes:dic];
//    }
//    navigationBar.translucent = NO;
//}
























@end
