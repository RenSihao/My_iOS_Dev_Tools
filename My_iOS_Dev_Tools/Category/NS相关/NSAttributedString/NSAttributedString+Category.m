//
//  NSAttributedString+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSAttributedString+Category.h"

@implementation NSAttributedString (Category)

- (CGSize)boundsWithConstraintWidth:(CGFloat)width
{
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              context:nil].size;
}

@end
