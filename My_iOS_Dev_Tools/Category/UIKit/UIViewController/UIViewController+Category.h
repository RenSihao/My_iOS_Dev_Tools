//
//  UIViewController+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  导航条按钮位置
 */
typedef NS_ENUM(NSInteger, BaseNavigationItemPosition) {
    /**
     *  左边
     */
    BaseNavigationItemPositionLeft  = 0,
    /**
     *  右边
     */
    BaseNavigationItemPositionRight = 1
};

@interface UIViewController (Category)



#pragma mark - HUD && AlertView

- (void)showTextHud:(NSString*)message;
- (void)showTextHudNoTab:(NSString*)message;
- (void)showTextHud:(NSString*)message delay:(int)delay;
- (void)showIndeterminateHud:(NSString *)text delay:(int)delay;
- (void)hideHud;
- (void)showSeaAlertViewWithDelegate:(id)delegate andMessage:(NSString *)str isWithCancelButton:(BOOL)isWithCancel;
- (void)disMissAlertView;


#pragma mark - readonly property 

/**
 *  是否有效可见
 */
- (BOOL)isVisible;

/**
 *  获取状态栏高度
 *
 *  @return
 */
- (CGFloat)statusBarHeight;

/**
 *  获取NavigationBar高度
 *
 *  @return
 */
- (CGFloat)navigationBarHeight;

/**
 *  获取TabBar高度
 *
 *  @return
 */
- (CGFloat)tabBarHeight;

/**
 *  获取可显示内容高度
 *
 *  @return
 */
- (CGFloat)contentHeight;

/**
 *  获取可显示内容宽度，默认就是屏幕宽度
 */
- (CGFloat)contentWidth;


/**设置返回按钮
 */
//@property(nonatomic,assign) BOOL backItem;
//
///**导航栏按钮或按钮字体颜色
// */
//@property(nonatomic,strong) UIColor *iconTintColor;
//
///**是否正在加载数据
// */
//@property(nonatomic,assign) BOOL loading;
//
///**是否正在网络请求
// */
//@property(nonatomic,assign) BOOL requesting;
//
///**是否显示网络活动指示器
// */
//@property(nonatomic,assign) BOOL showNetworkActivity;
//
///**加载失败
// */
//@property(nonatomic,strong) SeaBadNetworkRemindView *badNetworkRemindView;
//
///**加载指示
// */
//@property(nonatomic,strong) SeaLoadingIndicator *loadingIndicator;
//
///**活动指示
// */
//@property(nonatomic,strong) SeaNetworkActivityView *networkActivityView;
//
///**提示信息
// */
//@property(nonatomic,strong) SeaPromptView *promptView;
//
///**用于 present ViewController 的 statusBar 隐藏状态控制 default is 'NO' ，不隐藏
// */
//@property(nonatomic,assign) BOOL statusBarHidden;
//
///**状态栏高度
// */
//@property(nonatomic,readonly) CGFloat statusBarHeight;
//
///**导航栏高度
// */
//@property(nonatomic,readonly) CGFloat navigationBarHeight;
//
///**选项卡高度
// */
//@property(nonatomic,readonly) CGFloat tabBarHeight;
//
///**工具条高度
// */
//@property(nonatomic,readonly) CGFloat toolBarHeight;
//
///**内容高度
// */
//@property(nonatomic,readonly) CGFloat contentHeight;
//
//
///**没有数据时显示的内容 default is 'UILabel',灰色背景
// */
//@property(nonatomic,strong) UIView *hasNoMsgView;
//
///**关联的选项卡 default is 'nil'
// */
//@property(nonatomic,weak) SeaTabBarController *Sea_TabBarController;

/**当viewWillAppear时是否隐藏选项卡 default is 'YES'
 */
@property(nonatomic,assign) BOOL hideTabBar;

/**显示没有数据时的视图
 *@param hidden 是否显示
 *@param msg 提示的信息
 */
- (void)setHasNoMsgViewHidden:(BOOL) hidden msg:(NSString*) msg;

/**返回方法
 */
- (void)back;

/**长按返回第一个视图
 */
- (void)longPressBack:(UILongPressGestureRecognizer*) longPress;

/**dismss
 */
- (void)dismiss;

/**获取导航栏按钮 标题和图标只需设置一个
 *@param title 标题
 *@param icon 按钮图标
 *@param action 按钮点击方法
 *@return ios7以上 UIBarButtonItem, ios7以下 NSArray ,数组元素是 UIBarButtonItem
 */
- (id)barButtonItemWithTitle:(NSString*) title icon:(UIImage*) icon action:(SEL) action;

/**获取系统导航栏按钮
 *@param style 系统barButtonItem 样式
 *@param action 按钮点击方法
 *@return 一个根据style 初始化的 UIBarButtonItem 对象，颜色是 iconTintColor
 */
- (UIBarButtonItem*)systemBarButtonItemWithStyle:(UIBarButtonSystemItem) style action:(SEL) action;

/**获取自定义按钮的导航栏按钮
 *@param type 自定义按钮类型
 *@param action 按钮点击方法
 *@return 一个初始化的 UIBarButtonItem
 */
//- (UIBarButtonItem*)itemWithButtonWithType:(SeaButtonType) type action:(SEL) action;

/**设置导航条左边按钮 标题和图标只需设置一个
 *@param title 标题
 *@param icon 按钮图标
 *@param action 按钮点击方法
 *@param position 按钮位置
 */
//- (void)setBarItemsWithTitle:(NSString*) title icon:(UIImage*) icon action:(SEL) action position:(SeaNavigationItemPosition) position;
//
///**通过系统barButtonItem 设置导航条左边按钮
// *@param style 系统barButtonItem 样式
// *@param action 按钮点击方法
// *@param position 按钮位置
// */
//- (void)setBarItemsWithStyle:(UIBarButtonSystemItem) style action:(SEL) action position:(SeaNavigationItemPosition) position;
//
///**通过自定的按钮类型 设置导航条左边按钮
// *@param buttonType 自定义按钮类型
// *@param action 按钮点击方法
// *@param position 按钮位置
// */
////- (void)setBarItemWithButtonType:(SeaButtonType) buttonType action:(SEL) action position:(SeaNavigationItemPosition) position;
//
///**通过自定义视图 设置导航条右边按钮
// *@param customView 自定义视图
// */
//- (void)setBarItemWithCustomView:(UIView*) customView position:(SeaNavigationItemPosition) position;
//
///**设置dismiss 按钮
// *@param position 按钮位置
// */
//- (void)setDismissBarItemWithPosition:(SeaNavigationItemPosition) position;

/**设置导航条样式 默认不透明
 *@param backgroundColor 背景颜色
 *@param titleColor 标题颜色
 *@param font 标题字体
 */
- (void)setupNavigationBarWithBackgroundColor:(UIColor*) backgroundColor titleColor:(UIColor*) titleColor titleFont:(UIFont*) font;

/**设置默认导航栏样式
 */
- (void)setupDefaultNavigationBar;

/**通过添加navigationBar展现
 *@param viewController 用于 presentViewController:self
 *@param animated 是否动画展示
 *@param completion 视图出现完成回调
 */
- (void)showInViewController:(UIViewController*) viewController animated:(BOOL) animated completion:(void(^)(void)) completion;

/**直接展现 没有导航条
 *@param viewController 用于 presentViewController:self
 *@param animated 是否动画展示
 *@param completion 视图出现完成回调
 */
- (void)showInViewControllerWithoutNavigationBar:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;

/**创建导航栏并返回 UINavigationController
 */
- (UINavigationController*)createdInNavigationController;

#pragma mark- load data

/**加载数据失败
 */
- (void)failToLoadData;

/**重新加载数据 默认不做任何事，子类可以重写该方法
 */
- (void)reloadDataFromNetwork;

#pragma mark- alert

/**网络请求指示器信息
 *@param msg 提示的信息
 */
- (void)setShowNetworkActivityWithMsg:(NSString*) msg;

/**提示信息
 *@param msg 要提示的信息
 */
- (void)alertMsg:(NSString*) msg;

/**网络不佳的提示信息
 *@param msg 要提示的信息
 */
- (void)alerBadNetworkMsg:(NSString*) msg;


#pragma mark- Class Method

/**获取导航栏按钮 标题和图标只需设置一个
 *@param title 标题
 *@param icon 按钮图标
 *@param target 方法执行者
 *@param action 按钮点击方法
 *@param tintColor 主题颜色
 *@return ios7以上 UIBarButtonItem, ios7以下 NSArray ,数组元素是 UIBarButtonItem
 */
+ (id)barButtonItemWithTitle:(NSString*) title icon:(UIImage*) icon target:(id) target action:(SEL) action tintColor:(UIColor*) tintColor;

/**设置导航条样式 默认不透明
 *@param navigationBar 要设置的导航栏
 *@param backgroundColor 背景颜色
 *@param titleColor 标题颜色
 *@param font 标题字体
 */
+ (void)setupNavigationBar:(UINavigationBar*)navigationBar withBackgroundColor:(UIColor*) backgroundColor titleColor:(UIColor*) titleColor titleFont:(UIFont*) font;



@end
