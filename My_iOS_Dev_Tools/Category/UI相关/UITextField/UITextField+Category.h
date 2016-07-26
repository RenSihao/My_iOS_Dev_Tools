//
//  UITextField+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

#pragma mark- 内嵌视图

/**设置输入框左边图标
 *@param imageName 图标名称
 *@param padding 图标与文字的间距
 */
- (void)setLeftViewWithImageName:(NSString*) imageName padding:(CGFloat) padding;

/**设置输入框右边图标
 *@param imageName 图标名称
 *@param padding 图标与文字的间距
 */
- (void)setRightViewWithImageName:(NSString*) imageName padding:(CGFloat) padding;

/**底部分割线
 *@param color 分割线颜色
 *@param height 分割线高度
 */
- (void)setSeparatorLineWithColor:(UIColor*) color height:(CGFloat) height;

#pragma mark- 文本限制

/**文本变化，在textDidChange中调用
 *@param count 输入框最大可输入字数
 */
- (void)textDidChangeWithLimitedCount:(NSInteger) count;

/**在textField的代理中调用
 *@param range 文本变化的范围
 *@param string 替换的文字
 *@param count 输入框最大可输入字数
 */
- (BOOL)textShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string limitedCount:(NSInteger) count;

/**设置默认的附加视图
 *@param target 方法执行者
 *@param action 方法
 */
- (void)setDefaultInputAccessoryViewWithTarget:(id) target action:(SEL) action;
@end
