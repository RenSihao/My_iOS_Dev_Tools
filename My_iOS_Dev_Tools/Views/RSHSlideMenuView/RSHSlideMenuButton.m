//
//  RSHSlideMenuButton.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/20.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "RSHSlideMenuButton.h"

@interface RSHSlideMenuButton ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *color;
@end

@implementation RSHSlideMenuButton

- (instancetype)initWithTitle:(NSString *)title color:(UIColor *)color
{
    if (self = [super init]) {
        self.title = title;
        self.color = color;
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    // 获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    [self.color set];
    CGContextFillPath(context);
    
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius: rect.size.height/2];
    [self.color setFill];
    [roundedRectanglePath fill];
    [[UIColor whiteColor] setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attr = @{NSParagraphStyleAttributeName:paragraphStyle,NSFontAttributeName:[UIFont systemFontOfSize:24.0f],NSForegroundColorAttributeName:[UIColor whiteColor]};
    CGSize size = [self.title sizeWithAttributes:attr];
    
    CGRect r = CGRectMake(rect.origin.x,
                          rect.origin.y + (rect.size.height - size.height)/2.0,
                          rect.size.width,
                          size.height);
    
    [self.title drawInRect:r withAttributes:attr];
}

@end
