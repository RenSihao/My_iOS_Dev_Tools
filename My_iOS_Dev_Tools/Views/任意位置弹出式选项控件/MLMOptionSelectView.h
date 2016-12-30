//
//  MLMOptionSelectView.h
//  MLMOptionSelectView
//
//  Created by my on 16/10/12.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Category.h"

#define KEYWINDOW [UIApplication sharedApplication].keyWindow
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define WEAK(weaks,s)  __weak __typeof(&*s)weaks = s;

typedef enum : NSUInteger {
    MLMOptionSelectViewTypeCustom,//默认风格
    MLMOptionSelectViewTypeArrow,//带箭头的下拉框
} MLMOptionSelectViewType;


///弹出方向,左右上下的区别，只有在上下或者左右都显示不下时，优先考虑的方向
typedef enum : NSUInteger {
    MLMOptionSelectViewBottom,//下
    MLMOptionSelectViewTop,//上
    MLMOptionSelectViewLeft,//左
    MLMOptionSelectViewRight//右
} MLMOptionSelectViewDirection;


typedef void(^ActionBack)(NSIndexPath*);

@interface MLMOptionSelectView : UITableView



#pragma mark - 需要设置的属性
///设置Cell
@property (nonatomic, copy) UITableViewCell*(^cell)(NSIndexPath *);
@property (nonatomic, copy) NSInteger(^rowNumber)() ;
@property (nonatomic, copy) float(^optionCellHeight)();
#pragma mark - 事件回调
///删除回调
@property (nonatomic, copy) ActionBack removeOption;
///单击回调
@property (nonatomic, copy) ActionBack selectedOption;


// - 有默认值 - //
#pragma mark - 起点偏移
///最大显示行数，默认大于5行显示5行
@property (nonatomic, assign) NSInteger maxLine;
///是否可以删除,YES时请在删除回调中删除对应数据
@property (nonatomic, assign) BOOL canEdit;
///风格
@property (nonatomic, assign) MLMOptionSelectViewType optionType;


///背景颜色
@property (nonatomic, strong) UIColor *backColor;

///背景层颜色
@property (nonatomic, strong) UIColor *coverColor;

#pragma mark - 重要：改变箭头顶点的位置和动画开始位置
@property (nonatomic, assign) CGFloat arrow_offset;//(0 - 1之间)

///缩放 NO 竖直或水平展开 YES
@property (nonatomic, assign) BOOL vhShow;



#pragma mark - method
///init
- (instancetype)initOptionView;

/**
 *  计算一个view相对于其父视图在window上的frame，可以通过这个rect和弹出方向，来设置弹出的point
 *
 *  @param targetView 围绕展示的view
 *
 *  @return 相对其父视图在window上的frame
 */

+ (CGRect)targetView:(UIView *)targetView;

/**
 *  弹出视图
 *
 *  @param viewPoint     弹出后视图的原点
 *  @param width         能够显示的最大宽度
 *  @param targetView    弹出视图围绕显示的view
 *  @param directionType 弹出方向，在上下或者左右都能显示时，优先选择
 */
- (void)showViewFromPoint:(CGPoint)viewPoint
                viewWidth:(CGFloat)width
               targetView:(UIView *)targetView
                direction:(MLMOptionSelectViewDirection)directionType;

- (void)dismiss;





@end
