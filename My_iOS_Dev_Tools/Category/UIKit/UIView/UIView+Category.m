//
//  UIView+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/runtime.h>

static char tapKey;

@implementation UIView (Category)

#pragma mark -

CGPoint demoLGStart(CGRect bounds){
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.25);
}

CGPoint demoLGEnd(CGRect bounds){
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.75);
}

#pragma mark - frame

- (CGFloat)x
{
    return self.frame.origin.x;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (CGFloat)width
{
    return self.bounds.size.width;
}
- (CGFloat)height
{
    return self.bounds.size.height;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGSize)size
{
    return self.bounds.size;
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(centerY, self.center.y);
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)bottomFromSuperView
{
    return self.superview.height - self.y - self.height;
}

//添加单击手势
- (void)tapHandle:(TapAction)block {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &tapKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void)tapAction:(UITapGestureRecognizer *)tap {
    TapAction blcok = objc_getAssociatedObject(self, &tapKey);
    if (blcok) {
        blcok();
    }
}
//添加抖动动画
- (void)shakeView
{
    //    CGFloat t =4.0;
    //    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    //    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    //    self.transform = translateLeft;
    //    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
    //        [UIView setAnimationRepeatCount:2.0];
    //        self.transform = translateRight;
    //    } completion:^(BOOL finished){
    //        if(finished){
    //            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
    //                self.transform =CGAffineTransformIdentity;
    //            } completion:NULL];
    //        }
    //    }];
    
    //view抖动
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    anim.repeatCount = 1;
    anim.values = @[@-4,@4,@-4,@4];
    [self.layer addAnimation:anim forKey:nil];
}
- (void)shakeRotation:(CGFloat)rotation {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.repeatCount = 2;
    anim.duration = .2;
    anim.values = @[@0,@(rotation),@0,@(-rotation),@0];
    [self.layer addAnimation:anim forKey:nil];
}

#pragma mark -

//在原来的宽、高上加上一定的尺寸
- (void)plusWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width += width;
    self.frame = frame;
}
- (void)plusHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height += height;
    self.frame = frame;
}

//在原来的左、上边距加上一定的尺寸
- (void)plusLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x += x;
    self.frame = frame;
}
- (void)plusTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y += y;
    self.frame = frame;
}

//是否含有子View
-(BOOL)containsSubView:(UIView *)subView
{
    for (UIView *childView in self.subviews)
    {
        if (subView == childView)
        {
            return YES;
        }
    }
    return NO;
}
- (BOOL)containsSubViewClass:(Class)cls
{
    for (UIView *childView in self.subviews)
    {
        if ([childView isMemberOfClass:cls])
        {
            return YES;
        }
    }
    return NO;
}

//调整UIView旋转方向
-(CGAffineTransform)transformForOrientation:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(-M_PI_2);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI_2);
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
    } else{
        return CGAffineTransformIdentity;
    }
}
-(UIInterfaceOrientation)currentOrientation
{
    return [UIApplication sharedApplication].statusBarOrientation;
}
-(UIInterfaceOrientation)resetOrientation
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (orientation) {
        case UIInterfaceOrientationLandscapeLeft:
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIInterfaceOrientationLandscapeRight:
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        default:
            break;
    }
    
    [self setTransform:transform];
    return orientation;
}

//移除子控件
- (void)removeAllSubviews
{
    //方法1
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //方法2
    while (self.subviews.count)
    {
        UIView *subview = self.subviews.lastObject;
        [subview removeFromSuperview];
    }
}
//移除除了给定的view外的所有子view
- (void)removeAllSubviewsExcept:(UIView*)view
{
    while (self.subviews.count)
    {
        UIView *subview = self.subviews.lastObject;
        if (subview != view)
        {
            [subview removeFromSuperview];
        }
    }
}
- (void)removeAllSubviewsExceptViews:(NSArray*)views
{
    for (UIView *subview in self.subviews)
    {
        if (![views containsObject:subview])
        {
            [subview removeFromSuperview];
        }
    }
}

//设置缩放
-(void)setScaleX:(float)scaleX andY:(float)scaleY
{
    [self setTransform:CGAffineTransformMakeScale(scaleX, scaleY)];
}

//父controller
- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}




+ (void)drawGradientInRect:(CGRect)rect withColors:(NSArray*)colors
{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors)
    {
        [ar addObject:(id)c.CGColor];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGContextClipToRect(context, rect);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, rect.size.height);
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
}
+ (void)drawLinearGradientInRect:(CGRect)rect colors:(CGFloat[])colours
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colours, NULL, 2);
    CGColorSpaceRelease(rgb);
    CGPoint start, end;
    
    start = demoLGStart(rect);
    end = demoLGEnd(rect);
    
    CGContextClipToRect(context, rect);
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
}
+ (void) drawRoundRectangleInRect:(CGRect)rect withRadius:(CGFloat)radius
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rrect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height );
    
    CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
}
+ (void)drawLineInRect:(CGRect)rect colors:(CGFloat[])colors
{
    [UIView drawLineInRect:rect colors:colors width:1 cap:kCGLineCapButt];
    
}
+ (void)drawLineInRect:(CGRect)rect red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    CGFloat colors[4];
    colors[0] = red;
    colors[1] = green;
    colors[2] = blue;
    colors[3] = alpha;
    [UIView drawLineInRect:rect colors:colors];
}
+ (void)drawLineInRect:(CGRect)rect colors:(CGFloat[])colors width:(CGFloat)lineWidth cap:(CGLineCap)cap
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    
    CGContextSetRGBStrokeColor(context, colors[0], colors[1], colors[2], colors[3]);
    CGContextSetLineCap(context,cap);
    CGContextSetLineWidth(context, lineWidth);
    
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(context,rect.origin.x+rect.size.width, rect.origin.y+rect.size.height);
    CGContextStrokePath(context);
    
    
    CGContextRestoreGState(context);
    
}
+ (void)drawRect:(CGRect)rect fill:(const CGFloat*)fillColors radius:(CGFloat)radius
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    if (fillColors) {
        CGContextSaveGState(context);
        CGContextSetFillColor(context, fillColors);
        if (radius) {
            UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
            CGContextAddPath(context, path.CGPath);
            CGContextFillPath(context);
        } else {
            CGContextFillRect(context, rect);
        }
        CGContextRestoreGState(context);
    }
    
    CGColorSpaceRelease(space);
}

+ (void)drawRect:(CGRect)rect fillColor:(UIColor *)fillColor radius:(CGFloat)radius
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    if (fillColor)
    {
        CGContextSaveGState(context);
        const CGFloat* components = CGColorGetComponents(fillColor.CGColor);
        CGContextSetRGBFillColor(context, components[0], components[1], components[2], components[3]);
        if (radius){
            UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
            CGContextAddPath(context, path.CGPath);
            CGContextFillPath(context);
        } else {
            CGContextFillRect(context, rect);
        }
        CGContextRestoreGState(context);
    }
    
    CGColorSpaceRelease(space);
}

+ (void)strokeLines:(CGRect)rect stroke:(const CGFloat*)strokeColor
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    CGContextSaveGState(context);
    CGContextSetStrokeColorSpace(context, space);
    CGContextSetStrokeColor(context, strokeColor);
    CGContextSetLineWidth(context, 1.0);
    
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y-0.5},
            {rect.origin.x+rect.size.width, rect.origin.y-0.5}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y+rect.size.height-0.5},
            {rect.origin.x+rect.size.width-0.5, rect.origin.y+rect.size.height-0.5}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+rect.size.width-0.5, rect.origin.y},
            {rect.origin.x+rect.size.width-0.5, rect.origin.y+rect.size.height}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    {
        CGPoint points[] = {{rect.origin.x+0.5, rect.origin.y},
            {rect.origin.x+0.5, rect.origin.y+rect.size.height}};
        CGContextStrokeLineSegments(context, points, 2);
    }
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(space);
}





@end
