//
//  UIView+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)();
@interface UIView (Category)

#pragma mark - frame

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign, readonly) CGFloat bottomFromSuperView;

//添加单击手势
- (void)tapHandle:(TapAction)block;
//添加抖动动画
- (void)shakeView;
- (void)shakeRotation:(CGFloat)rotation;

//在原来的宽、高上加上一定的尺寸
- (void)plusWidth:(CGFloat)width;
- (void)plusHeight:(CGFloat)height;

//在原来的左、上边距加上一定的尺寸
- (void)plusLeft:(CGFloat)x;
- (void)plusTop:(CGFloat)y;

//是否含有子View
-(BOOL)containsSubView:(UIView *)subView;
- (BOOL)containsSubViewClass:(Class)cls;

//调整UIView旋转方向
-(CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientation;
-(UIInterfaceOrientation)currentOrientation;
-(UIInterfaceOrientation)resetOrientation;

//移除子控件
- (void)removeAllSubviews;
- (void)removeAllSubviewsExcept:(UIView*)view;

//移除除了给定的view外的所有子view
- (void)removeAllSubviewsExceptViews:(NSArray*)views;

//设置缩放
-(void)setScaleX:(float)scaleX andY:(float)scaleY;

//父controller
- (UIViewController*)viewController;

#pragma mark -




// DRAW GRADIENT
+ (void)drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors;
+ (void)drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colors;


// DRAW ROUNDED RECTANGLE
+ (void)drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius;

// DRAW LINE
+ (void)drawLineInRect:(CGRect)rect red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (void)drawLineInRect:(CGRect)rect colors:(CGFloat[])colors;
+ (void)drawLineInRect:(CGRect)rect colors:(CGFloat[])colors width:(CGFloat)lineWidth cap:(CGLineCap)cap;

// FILL RECT
+ (void)drawRect:(CGRect)rect fill:(const CGFloat*)fillColors radius:(CGFloat)radius;
+ (void)drawRect:(CGRect)rect fillColor:(UIColor *)fillColor radius:(CGFloat)radius;

// STROKE RECT
+ (void)strokeLines:(CGRect)rect stroke:(const CGFloat*)strokeColor;
@end
