//
//  FirstVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "FirstVC.h"
#import "RSHSlideMenuView.h"

@interface FirstVC ()
<
UITableViewDelegate,
UITableViewDataSource,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FirstVC

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
    
    self.title = @"First";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_more"] style:UIBarButtonItemStyleDone target:self action:@selector(showSlideMenu)];
    
    // empty
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}

#pragma mark - SlideMenu(侧边弹出栏)

- (void)showSlideMenu
{
    RSHSlideMenuView *slideMenu = [[RSHSlideMenuView alloc] initWithTitles:@[@"首页", @"消息", @"个人"] buttonHeight:44.f menuColor:[UIColor redColor] backgroundBlurColor:UIBlurEffectStyleLight];
    [slideMenu show];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITableViewCell identifier]];
    cell.textLabel.text = [UITableViewCell identifier];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

#pragma mark - DZNEmptyDataSetSource

/**
 * 设置默认空白界面处理视图的标题Title.
 * 若需要设置富文本，则返回时设置(NSAttributedString *)类型
 */
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *title = @"this is title for empty";
    NSMutableParagraphStyle *pragraph = [NSMutableParagraphStyle new];
    pragraph.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:15],
                                 NSForegroundColorAttributeName: [UIColor blackColor],
                                 NSParagraphStyleAttributeName: pragraph};
    
    return [[NSMutableAttributedString alloc] initWithString:title attributes:attributes];
}

/**
 * 设置默认空白界面处理视图的描述description文本
 * 若需要设置富文本，则返回时设置(NSAttributedString *)类型
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *description = @"this is description for empty \n this is description for empty this is description for empty \n this is description for empty \n this is description for empty \n this is description for empty this is description for empty \n this is description for empty";
//    NSString *description = @"this is description";
    
    /*
     段落属性
     */
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    
    // 文字对齐方式
    paragraph.alignment = NSTextAlignmentCenter;
    
    // 行间距
    paragraph.lineSpacing = 10;
//
//    // 首行缩进
//    paragraph.firstLineHeadIndent = 20;
//    
//    // 段与段之间的间距
//    paragraph.paragraphSpacing = 30;
//    
//
//
//    //
//    paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
//    
//    // 书写方式
//    paragraph.baseWritingDirection = NSWritingDirectionLeftToRight;
//    
//    // 整体缩进20（首行除外）
//    paragraph.headIndent = 20;
//    paragraph.tailIndent = 20;
//    
//    // 最小行高
//    paragraph.minimumLineHeight = 10;
//    
//    // 最大行高
//    paragraph.maximumLineHeight = 20;
//    
//    // 段首行空白空间
//    paragraph.paragraphSpacingBefore = 20.f;
//    
//    //
//    paragraph.lineHeightMultiple = 15;
    //连字属性 在iOS，唯一支持的值分别为0和1
//    paragraph.hyphenationFactor = 1;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],
                                 NSParagraphStyleAttributeName: paragraph,
                                 NSForegroundColorAttributeName: [UIColor blackColor]};
    
    return [[NSMutableAttributedString alloc] initWithString:description attributes:attributes];
}

/**
 * 设置默认空白界面布局的图片
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}

/**
 * 设置默认空白界面布局图片的前景色，默认为nil.
 */
- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor grayColor];
}

/**
 * 设置默认空白界面图片的动画效果
 */
- (CAAnimation *) imageAnimationForEmptyDataSet:(UIScrollView *) scrollView
{
    return nil;
}

/**
 * 设置默认空白界面响应按钮的标题，通常我们可以设置为"重新加载"等文本
 * 如果需要显示不同的标题样式，可以返回富文本
 * 并传入UIControlState进行设置点击或者普通状态等
 */
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    NSString *buttonTitle = @"this is button title";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    return [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
}

/**
 * 设置默认空白界面响应按钮的图片
 * 并传入UIControlState进行设置点击或者普通状态等
 */
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"bubble"];
}

/**
 * 设置默认空白界面响应按钮的背景图片默认不设置
 * 并传入UIControlState进行设置点击或者普通状态等
 */
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return nil;
}

/**
 * 设置默认空白界面的背景颜色默认为[UIColor clearColor]
 */
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor yellowColor];
}

/**
 * 设置默认空白界面的自定义视图View, View中可以高度自定义，包括按钮图片以及标题等元素
 * 并传入UIControlState进行设置点击或者普通状态等
 * 返回自定义视图，将会忽略以下方法的配置
 * -offsetForEmptyDataSet 和 -spaceHeightForEmptyDataSet
 */
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}

/**
 * 设置界面的垂直和水平方向的对齐约束， 默认为CGPointZero
 */
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return 0;
}

/**
 * 设置界面元素的垂直间距，默认为11px
 */
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 0;
}

#pragma mark - DZNEmptyDataSetDelegate

// 数据源为空时，是否渲染显示
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

// 空白视图是否强制显示（即使数据源不为空）
- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView
{
    return NO;
}

// 空白视图显示时是否采用渐隐式动画
- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView
{
    return YES;
}

// 是否允许触摸事件
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

// 是否允许滚动
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

// 是否允许动画
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return YES;
}

// 处理空白区域的点击事件
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    NSLog(@"%s", __func__);
}

// 处理按钮的点击事件
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    NSLog(@"%s", __func__);
}

// 空白视图即将出现
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// 空白视图已经出现
- (void)emptyDataSetDidAppear:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// 空白视图即将消失
- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

// 空白视图已经消失
- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.contentWidth, self.contentHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
        
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:[UITableViewCell identifier]];
    }
    return _tableView;
}














@end


