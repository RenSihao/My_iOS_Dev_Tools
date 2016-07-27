//
//  UITextField+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

#pragma mark- 内嵌视图

/**设置输入框左边图标
 *@param imageName 图标名称
 *@param padding 图标与文字的间距
 */
- (void)setLeftViewWithImageName:(NSString*)imageName padding:(CGFloat)padding
{
    self.leftViewMode = UITextFieldViewModeAlways;
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height- image.size.height) / 2.0, image.size.width + padding, image.size.height)];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = image;
    self.leftView = imageView;
}

/**设置输入框右边图标
 *@param imageName 图标名称
 *@param padding 图标与文字的间距
 */
- (void)setRightViewWithImageName:(NSString*) imageName padding:(CGFloat)padding
{
    self.rightViewMode = UITextFieldViewModeAlways;
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height - image.size.height) / 2.0, image.size.width + padding, image.size.height)];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = image;
    self.rightView = imageView;
    
}

/**底部分割线
 *@param color 分割线颜色
 *@param height 分割线高度
 */
- (void)setSeparatorLineWithColor:(UIColor *)color height:(CGFloat)height
{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - height, self.frame.size.width, height)];
    lineView.backgroundColor = color;
    [self addSubview:lineView];
}

#pragma mark- 文本限制

/**文本变化，在textDidChange中调用
 *@param count 输入框最大可输入字数
 */
- (void)textDidChangeWithLimitedCount:(NSInteger) count
{
    UITextRange *textRange = [self markedTextRange];
    if(textRange == nil && self.text.length > count)
    {
        self.text = [self.text substringWithRange:NSMakeRange(0, count)];
    }
}

/**在textField的代理中调用
 *@param range 文本变化的范围
 *@param string 替换的文字
 *@param count 输入框最大可输入字数
 */
- (BOOL)textShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string limitedCount:(NSInteger) count
{
    UITextRange *textRange = [self markedTextRange];
    
    NSString *markText = [self textInRange:textRange];
    
    NSString *new = [self.text stringByReplacingCharactersInRange:range withString:string];
    
    NSInteger length = new.length - (textRange.empty ? 0 : markText.length + 1);
    
    NSInteger res = count - length;
    
    
    if(res > 0)
    {
        return YES;
    }
    else
    {
        NSInteger len = count - self.text.length;
        if(len < 0)
            len = 0;
        if(len > string.length)
            len = string.length;
        
        NSString *str = [self.text stringByReplacingCharactersInRange:range withString:[string substringWithRange:NSMakeRange(0, len)]];
        self.text = str;
        
        return NO;
    }
}

/**设置默认的附加视图
 *@param target 方法执行者
 *@param action 方法
 */
- (void)setDefaultInputAccessoryViewWithTarget:(id) target action:(SEL) action
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35.0)];
    view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    
    CGFloat buttonWidth = 60.0;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - buttonWidth, 0, buttonWidth, 35.0)];
    [view addSubview:button];
    self.inputAccessoryView = view;
    
}

@end
