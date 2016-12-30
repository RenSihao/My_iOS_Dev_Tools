//
//  RSHSlideMenuView.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/20.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "RSHSlideMenuView.h"
#import "RSHSlideMenuButton.h"

// 边界弹性宽度（实际上是看不见的）
static CGFloat RSHSlideMenuBlankWidth = 50.f;

@interface RSHSlideMenuView ()

// 毛玻璃特效view
@property (nonatomic, strong) UIVisualEffectView *blurView;

// 按钮高度
@property (nonatomic, assign) CGFloat menuBtnHeight;

// 按钮宽度
@property (nonatomic, assign) CGFloat menuBtnWidth;

// 按钮垂直间距
@property (nonatomic, assign) CGFloat menuBtnVerticalMargin;

// 主题色
@property (nonatomic, strong) UIColor *menuColor;

// 辅助视图1
@property (nonatomic, strong) UIView *helperSlideView;

// 辅助视图2
@property (nonatomic, strong) UIView *helperCenterView;

// 计时器
@property (nonatomic, strong) CADisplayLink *displayLink;

// x坐标之差
@property (nonatomic, assign) CGFloat xDiffValue;

// 当前状态
@property (nonatomic, assign, getter=isShow) BOOL show;

// 动画计数（决定何时移除CADisplayLink）
@property (nonatomic, assign) NSInteger animationCount;

@end

@implementation RSHSlideMenuView

#pragma mark - init

- (instancetype)initWithTitles:(NSArray *)titles
{
    return [self initWithTitles:titles
                   buttonHeight:40.f
                      menuColor:[UIColor colorWithRed:0 green:0.722 blue:1 alpha:1]
            backgroundBlurColor:UIBlurEffectStyleLight];
}
- (instancetype)initWithTitles:(NSArray *)titles
                  buttonHeight:(CGFloat)btnHeight
                     menuColor:(UIColor *)color
           backgroundBlurColor:(UIBlurEffectStyle)style
{
    if (self = [super init]) {
        
        self.menuBtnHeight         = btnHeight;
        self.menuBtnWidth          = kScreenWidth/2-20*2;
        self.menuBtnVerticalMargin = 30.f;
        self.menuColor             = color;
        
        // 创建毛玻璃视图 (完全透明)
        self.blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
        self.blurView.frame = AppKeyWindow().frame;
        self.blurView.alpha = 0.0f;
        
        // 创建并添加辅助视图1
        self.helperSlideView = [[UIView alloc] initWithFrame:CGRectMake(-40, 0, 40, 40)];
        self.helperSlideView.backgroundColor = [UIColor redColor];
        self.helperSlideView.hidden = YES;
        [AppKeyWindow() addSubview:self.helperSlideView];
        
        // 创建并添加辅助视图2
        self.helperCenterView = [[UIView alloc] initWithFrame:CGRectMake(-40, CGRectGetHeight(AppKeyWindow().frame)/2-20, 40, 40)];
        self.helperCenterView.backgroundColor = [UIColor yellowColor];
        self.helperCenterView.hidden = YES;
        [AppKeyWindow() addSubview:self.helperCenterView];
        
        // 添加self到window 且在辅助视图1下面
        self.frame = CGRectMake(-kScreenWidth/2-RSHSlideMenuBlankWidth, 0, kScreenWidth/2+RSHSlideMenuBlankWidth, kScreenHeight);
        self.backgroundColor = [UIColor clearColor];
        [AppKeyWindow() insertSubview:self belowSubview:self.helperSlideView];
        
        // 创建并添加按钮
        [self addButtons:titles];
    }
    return self;
}

#pragma mark - public methods

- (void)show
{
    if (self.isShow) {
        [self dismiss];
    } else {
        // show
        
        /*
         动画思路：
         1、将辅助视图1和辅助视图2分别赋值不同的动画参数，利用系统弹性动画天生的回弹震荡特性，那么两个辅助视图的横坐标x值实时之差，就能得到一组从0增至一个正数，然后递减到一个负数，最后再回到0的数据。
         2、确保拿到这组数据后，实时利用CADisplayLink去重绘，fps60，1s重绘60次
         */
        
        // 将毛玻璃视图嵌在self下面
        [AppKeyWindow() insertSubview:self.blurView belowSubview:self];
        
        // self 的 origin 从屏幕外移动到（0，0）
        // 毛玻璃透明度 0.3s内 从0不透明 -> 0.5半透明
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = self.bounds;
            self.blurView.alpha = 0.5f;
        }];
        
        /*
         
         + (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
         这里赋值不同的动画系数，是指下面几个参数
         
                                辅助视图1    辅助视图2
         阻尼比：dampingRatio       0.5        0.8
         弹簧初速度：velocity        0.9        2.0
         
         为什么是这几个数字？仔细体会 -。-
         */
        
        // 辅助视图1开始动画
        [self beforeAnimation];
        [UIView animateWithDuration:0.7 delay:0.0f usingSpringWithDamping:0.5 initialSpringVelocity:0.9 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            // 辅助视图1 向右平移半个屏幕的距离（一开始在屏幕外边）
            self.helperSlideView.center = CGPointMake(AppKeyWindow().center.x, self.helperSlideView.center.y);
        } completion:^(BOOL finished) {
            // 辅助视图1结束动画
            [self finishAnimation];
        }];
        
        // 辅助视图2开始动画
        [self beforeAnimation];
        [UIView animateWithDuration:0.7 delay:0.0f usingSpringWithDamping:0.8f initialSpringVelocity:2.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            // 辅助视图2 向右平移半个屏幕的距离（一开始在屏幕外边）
            self.helperCenterView.center = AppKeyWindow().center;
        } completion:^(BOOL finished) {
            // 辅助视图2结束动画
            // 同时毛玻璃上添加手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
            [self.blurView addGestureRecognizer:tap];
            [self finishAnimation];
        }];
        
        // 按钮开始动画
        [self animatedButtons];
        self.show = YES;
    }
}
- (void)dismiss
{
    if (self.isShow) {
        // dismiss
        
        /*
         动画思路：即show的反向做法，路径全部倒回去
         */
        
        // self 的origin 从（0， 0）退回到屏幕外
        // 毛玻璃从半透明到完全透明
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = CGRectMake(-kScreenWidth/2-RSHSlideMenuBlankWidth, 0, kScreenWidth/2+RSHSlideMenuBlankWidth, kScreenHeight);
            self.blurView.alpha = 0.0;
        } completion:^(BOOL finished) {
            if (finished) {
                [self.blurView removeFromSuperview];
            }
        }];
        
        /*
                                辅助视图1    辅助视图2
         阻尼比：dampingRatio       0.6        0.7
         弹簧初速度：velocity        0.9        2.0
         */
        
        // 辅助视图1开始动画
        [self beforeAnimation];
        [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.9 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            self.helperSlideView.center = CGPointMake(-kScreenWidth/2-RSHSlideMenuBlankWidth, self.helperSlideView.center.y);
        } completion:^(BOOL finished) {
            [self finishAnimation];
        }];
        
        // 辅助视图2开始动画
        [self beforeAnimation];
        [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:2.0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            self.helperCenterView.center = CGPointMake(-kScreenWidth/2-RSHSlideMenuBlankWidth, self.helperCenterView.center.y);
        } completion:^(BOOL finished) {
            if (finished) {
                [self finishAnimation];
            }
        }];
        
        self.show = NO;
        
    } else {
        [self show];
    }
}

#pragma mark - private methods

// 创建并添加按钮
- (void)addButtons:(NSArray *)titles
{
    if (titles.count %2 == 0) {
        // 双数
        NSInteger index_down = titles.count/2;
        NSInteger index_up = -1;
        
        for (NSInteger i=0; i<titles.count; i++) {
            
            RSHSlideMenuButton *btn = [[RSHSlideMenuButton alloc] initWithTitle:titles[i] color:self.menuColor];
            btn.bounds = CGRectMake(0, 0, self.menuBtnWidth, self.menuBtnHeight);
            
            if (i >= titles.count / 2) {
                index_up ++;
                btn.center = CGPointMake(kScreenWidth/4, kScreenHeight/2 + self.menuBtnHeight*index_up + self.menuBtnVerticalMargin*index_up + self.menuBtnVerticalMargin/2 + self.menuBtnHeight/2);
            }else{
                index_down --;
                btn.center = CGPointMake(kScreenWidth/4, kScreenHeight/2 - self.menuBtnHeight*index_down - self.menuBtnVerticalMargin*index_down - self.menuBtnVerticalMargin/2 - self.menuBtnHeight/2);
            }
            
            [self addSubview:btn];
        }
        
    } else {
        // 单数
        NSInteger index = (titles.count - 1) /2 +1;
        for (NSInteger i = 0; i < titles.count; i++) {
            index --;
            RSHSlideMenuButton *btn = [[RSHSlideMenuButton alloc] initWithTitle:titles[i] color:self.menuColor];
            btn.bounds = CGRectMake(0, 0, self.menuBtnWidth, self.menuBtnHeight);
            btn.center = CGPointMake(kScreenWidth/4, kScreenHeight/2 - self.menuBtnHeight*index - 20*index);
            [self addSubview:btn];
        }
    }
}

// 按钮出场动画
- (void)animatedButtons
{
    for (NSInteger i=0; i<self.subviews.count; i++) {
        RSHSlideMenuButton *btn = self.subviews[i];
        btn.transform = CGAffineTransformMakeTranslation(-360, 0);
        [UIView animateWithDuration:0.7 delay:i*(0.3/self.subviews.count) usingSpringWithDamping:0.6 initialSpringVelocity:0.0f options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            btn.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
}

// 动画开始前
- (void)beforeAnimation
{
    if (!self.displayLink) {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    self.animationCount ++;
}

// 动画结束后
- (void)finishAnimation
{
    self.animationCount --;
    if (self.animationCount == 0) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
}

// fps60帧 1s调用60次 实时获取frame 计算x之差 然后重绘 即1s重绘60次
- (void)displayLinkAction:(CADisplayLink *)displayLink
{
    // presentationLayer 可以获取layer的所有属性
    CALayer *slideLayer = [self.helperSlideView.layer presentationLayer];
    CALayer *centerLayer = [self.helperCenterView.layer presentationLayer];
    
    CGRect slideRect = [[slideLayer valueForKeyPath:@"frame"] CGRectValue];
    CGRect centerRect = [[centerLayer valueForKeyPath:@"frame"] CGRectValue];
    
    // 实时拿到差值
    self.xDiffValue = slideRect.origin.x - centerRect.origin.x;
    
    // 重绘边界
    // 这个方法会触发 UIView 的 drawRect  或 CALayer 的 drawRectInContext”
    [self setNeedsDisplay];
}

// 重绘边界，实现波浪回弹效果
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 画直线 矩形上面一条边
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width-RSHSlideMenuBlankWidth, 0)];
    
    // 画曲线 矩形右边一条边 即波浪回弹
    // 注意 控制点x坐标需要加上 self.xDiffValue
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width-RSHSlideMenuBlankWidth, self.frame.size.height)
                 controlPoint:CGPointMake(AppKeyWindow().frame.size.width/2+self.xDiffValue, AppKeyWindow().frame.size.height/2)];
    
    // 画直线 矩形下面一条边
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path.CGPath);
    [self.menuColor set];
    CGContextFillPath(context);
}

@end



