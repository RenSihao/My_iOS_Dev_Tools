//
//  UIScrollView+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIScrollView+Category.h"

@implementation UIScrollView (Category)

- (CGFloat)contentWidth
{
    return self.contentSize.width;
}
- (CGFloat)contentHeight
{
    return self.contentSize.height;
}
- (void)setContentWidth:(CGFloat)width
{
    CGSize size = self.contentSize;
    size.width = width;
    self.contentSize = size;
}
- (void)setContentHeight:(CGFloat)height
{
    CGSize size = self.contentSize;
    size.height = height;
    self.contentSize = size;
}


@end
