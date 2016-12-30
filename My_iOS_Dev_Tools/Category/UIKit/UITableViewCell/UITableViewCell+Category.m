//
//  UITableViewCell+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

+ (NSString *)identifier
{
    return NSStringFromClass(self.class);
}
- (void)addTopLine
{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor grayColor];
    line.frame = CGRectMake(0, 0, self.frame.size.width, 1);
    [self addSubview:line];
}

- (void)addBottomLine
{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor grayColor];
    line.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
    [self addSubview:line];
}




@end
