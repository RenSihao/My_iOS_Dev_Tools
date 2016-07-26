//
//  UITextView+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Category)

#pragma mark- 文本限制

/**内容改变 在代理textDidChange调用
 *@param count 限制的文字数量
 */
- (void)textDidChangeWithLimitedCount:(NSInteger) count;

/**是否替换内容 在代理shouldChangeTextInRange中调用
 *@param range 替换的范围
 *@param text 新的内容
 *@param count 限制的文字数量
 *@return 是否替换
 */
- (BOOL)shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text withLimitedCount:(NSInteger) count;

#pragma mark- 附加图

/**设置默认的附加视图
 *@param target 方法执行者
 *@param action 方法
 */
- (void)setDefaultInputAccessoryViewWithTarget:(id) target action:(SEL) action;
@end
