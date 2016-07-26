//
//  NSMutableAttributedString+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSMutableAttributedString+Category.h"
#import <CoreText/CoreText.h>

@implementation NSMutableAttributedString (Category)

- (CGSize)boundsWithWidth:(CGFloat)width
{
    if(self.length == 0)
        return CGSizeZero;
    CGFloat totalHeight = 0;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef) self);
    
    if(framesetter == NULL)
        return CGSizeZero;
    
    CGRect drawRect = CGRectMake(0, 0, width, CGFLOAT_MAX);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, drawRect);
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    if(frame == NULL)
    {
        CFRelease(framesetter);
        CFRelease(path);
        return CGSizeZero;
    }
    
    //获取行数和没行的起点
    CFArrayRef lines = CTFrameGetLines(frame);
    NSInteger count = CFArrayGetCount(lines);
    CGPoint lineOrigins[count];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    
    CGPoint lastLineOrigin = lineOrigins[count - 1]; //获取最后一行的起始坐标
    
    CGFloat descent;
    
    CTLineRef lastLine = CFArrayGetValueAtIndex(lines, count - 1);
    CTLineRef firstLine = CFArrayGetValueAtIndex(lines, 0);
    
    CTLineGetTypographicBounds(lastLine, NULL, &descent, NULL);
    
    CGFloat totalWidth = width;
    
    //如果只有一样，获取这一行的宽度
    if(count == 1)
    {
        totalWidth = CTLineGetTypographicBounds(firstLine, NULL, NULL, NULL);
    }
    
    totalHeight += CGRectGetMaxY(drawRect) - lastLineOrigin.y + descent + 1.0;
    
    CFRelease(framesetter);
    CFRelease(path);
    CFRelease(frame);
    
    return CGSizeMake(totalWidth, totalHeight);
}

@end
