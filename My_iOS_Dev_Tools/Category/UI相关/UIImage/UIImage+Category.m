//
//  UIImage+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

#pragma mark- init

/**图片初始化 png格式 使用initWithContentsOfFile
 *@param name 图片名称
 *@return 一个初始化的UIImage
 */
+ (UIImage*)bundleImageWithName:(NSString *)name
{
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
    return image;
}

/**从图片资源中获取图片数据
 *@return [UIImage imageFromAsset:asset options:SeaAssetImageOptionsResolutionImage];
 */
+ (UIImage*)imageFromAsset:(ALAsset *)asset
{
    return [UIImage imageFromAsset:asset options:SeaAssetImageOptionsResolutionImage];
}

/**从图片资源中获取图片数据
 *@param asset 资源文件类
 *@param options 从资源文件中获取图片的选项
 */
+ (UIImage*)imageFromAsset:(ALAsset*) asset options:(SeaAssetImageOptions) options
{
    if(asset == nil)
        return nil;
    
    ALAssetRepresentation *representation = [asset defaultRepresentation];
    
    //获取正确的图片方向
    UIImageOrientation orientation = UIImageOrientationUp;
    NSNumber *number = [asset valueForProperty:ALAssetPropertyOrientation];
    
    if(number != nil)
    {
        orientation = [number intValue];
    }
    
    UIImage *image = nil;
    
    switch (options)
    {
        case SeaAssetImageOptionsFullScreenImage :
        {
            //满屏的图片朝向已调整为 UIImageOrientationUp
            image = [UIImage imageWithCGImage:[representation fullScreenImage]];
        }
            break;
        case SeaAssetImageOptionsResolutionImage :
        {
            //图片朝向可能不正确，需要调整
            image = [UIImage imageWithCGImage:[representation fullResolutionImage] scale:representation.scale orientation:orientation];
        }
            break;
    }
    
    
    return image;
}

#pragma mark- resize

/**等比例缩小图片
 *@param size 要缩小的图片最大尺寸
 *@param type 缩小方式
 *@return 返回要缩小的图片尺寸
 */
- (CGSize)shrinkWithSize:(CGSize) size type:(SeaImageShrinkType) type
{
    return [UIImage shrinkImageSize:self.size withSize:size type:type];
}

/**等比例缩小图片
 *@param imageSize 要缩小的图片大小
 *@param size 要缩小的图片最大尺寸
 *@param type 缩小方式
 *@return 返回要缩小的图片尺寸
 */
+ (CGSize)shrinkImageSize:(CGSize) imageSize withSize:(CGSize) size type:(SeaImageShrinkType) type
{
    CGSize retSize = CGSizeZero;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    if(width == height)
    {
        width = MIN(width, size.width > size.height ? size.height : size.width);
        height = width;
    }
    else
    {
        CGFloat heightScale = height / size.height;
        CGFloat widthScale = width / size.width;
        
        switch (type)
        {
            case SeaImageShrinkTypeWidthAndHeight :
            {
                if(height >= size.height && width >= size.width)
                {
                    if(heightScale > widthScale)
                    {
                        height = floorf(height / heightScale);
                        width = floorf(width / heightScale);
                    }
                    else
                    {
                        height = floorf(height / widthScale);
                        width = floorf(width / widthScale);
                    }
                }
                else
                {
                    if(height >= size.height && width <= size.width)
                    {
                        height = floorf(height / heightScale);
                        width = floorf(width / heightScale);
                    }
                    else if(height <= size.height && width >= size.width)
                    {
                        height = floorf(height / widthScale);
                        width = floorf(width / widthScale);
                    }
                }
            }
                break;
            case SeaImageShrinkTypeWidth :
            {
                if(width > size.width)
                {
                    height = floorf(height / widthScale);
                    width = floorf(width / widthScale);
                }
            }
                break;
            case SeaImageShrinkTypeHeight :
            {
                if(height > size.height)
                {
                    height = floorf(height / heightScale);
                    width = floorf(width / heightScale);
                }
            }
                break;
            default:
                break;
        }
    }
    
    retSize = CGSizeMake(width, height);
    return retSize;
}

/**通过给定大小获取图片的缩率图
 *@param size 目标图片大小
 *@return 图片的缩略图
 */
- (UIImage*)aspectFitthumbnailWithSize:(CGSize)size
{
    size = [self shrinkWithSize:size type:SeaImageShrinkTypeWidthAndHeight];
    
    CGImageRef cgImage = self.CGImage;
    size_t width = CGImageGetWidth(cgImage);
    size_t height = CGImageGetHeight(cgImage);
    
    if(size.height >= height || size.width >= width)
        return self;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [self drawInRect:imageRect];
    UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(thumbnail);
    if(data == nil)
    {
        data = UIImageJPEGRepresentation(thumbnail, 1.0);
    }
    
    UIImage *ret = nil;

#ifdef __IPHONE_6_0
    ret = [UIImage imageWithData:data scale:thumbnail.scale];
    
#else
    ret = [UIImage imageWithData:data];
#endif

    
    if(ret.imageOrientation != UIImageOrientationUp)
    {
        ret = [UIImage imageWithCGImage:ret.CGImage scale:ret.scale orientation:UIImageOrientationUp];
    }
    
    return ret == nil ? thumbnail : ret;
}

/**居中截取的缩略图
 *@param size 目标图片大小
 *@return 图片的缩略图
 */
- (UIImage*)aspectFillThumbnailWithSize:(CGSize)size
{
    UIImage *ret = nil;
    
    if(self.size.width == self.size.height)
    {
        //正方形图片
        ret = self;
    }
    else if(self.size.width < size.width && self.size.height < size.height)
    {
        //图片小于目标大小
        ret = self;
    }
    else
    {
        size = [self shrinkWithSize:size type:SeaImageShrinkTypeWidthAndHeight];
        CGImageRef imageRef = self.CGImage;
        CGFloat imageWidth = CGImageGetWidth(imageRef);
        CGFloat imageHeight = CGImageGetHeight(imageRef);
        
        CGFloat multipleWidthNum = imageWidth / size.width;
        CGFloat multipleHeightNum = imageHeight / size.height;
        
        CGFloat scale = MIN(multipleWidthNum, multipleHeightNum);
        CGFloat width = size.width * scale;
        CGFloat height = size.height * scale;
        
        CGRect rect = CGRectMake((imageWidth - width) / self.scale, (imageHeight - height) / self.scale, width, height);
        CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
        
        if(subImageRef == NULL)
        {
            ret = self;
        }
        else
        {
            ret = [UIImage imageWithCGImage:subImageRef];
            CGImageRelease(subImageRef);
        }
    }
    
    return [ret aspectFitthumbnailWithSize:size];
}

/**截取图片
 *@param rect 要截取的rect
 *@return 截取的图片
 */
- (UIImage*)subImageWithRect:(CGRect)rect
{
    CGPoint origin = CGPointMake(-rect.origin.x, -rect.origin.y);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(rect.size.width), floorf(rect.size.height)), NO, 0.0f);
    [self drawAtPoint:origin];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

/**重绘图片
 *@return 重绘后的图片
 */
- (UIImage*)redraw
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(self.size.width), floorf(self.size.height)), NO, 0.0f);
    [self drawAtPoint:CGPointZero];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

/**获取一个圆形图片
 *@param color 图片圆形边框颜色
 *@param borderWidth 图片圆形边框线条宽度
 *@param padding 圆形图片的边距
 *@return 一个圆形图片
 */
- (UIImage*)circleImageWithBorderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth innerPadding:(CGFloat)padding
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(self.size.width + borderWidth), floorf(self.size.height + borderWidth)), NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //获取半径和圆心
    CGFloat radius = self.size.width > self.size.height ? self.size.height / 2.0 : self.size.width / 2.0;
    //    if(color)
    //    {
    //        radius -= (borderWidth + padding);
    //    }
    CGPoint center = CGPointMake(self.size.width / 2.0, self.size.height / 2.0);;
    
    //切割画板
    CGContextSetLineWidth(context, padding);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextAddArc(context, center.x, center.y, radius, 0.0, 2.0 * M_PI, YES);
    CGContextClip(context);
    
    //绘图
    [self drawAtPoint:CGPointMake(0, 0)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(color != nil)
    {
        return [self addCircleBorderWithBorderColor:color borderWidth:borderWidth innerPadding:padding image:image];
    }
    else
    {
        return image;
    }
}

//添加圆形边框
- (UIImage*)addCircleBorderWithBorderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth innerPadding:(CGFloat)padding image:(UIImage *)image
{
    CGSize size = CGSizeMake(image.size.width + borderWidth * 2, image.size.height + borderWidth * 2);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(size.width), floorf(size.height)), NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // NSLog(@"%f,%f",size.height, size.width);
    //画圆
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextStrokeEllipseInRect(context, CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height));
    
    //绘图
    [image drawAtPoint:CGPointMake(borderWidth + borderWidth / 2.0, borderWidth + borderWidth / 2.0)];
    
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

/**把UIImage轉成bitmap 需要调用free(),避免内存泄露
 */
- (unsigned char *)createRGBABitmap
{
    CGContextRef context = NULL;
    CGColorSpaceRef colorSpace;
    unsigned char *bitmap;
    size_t bitmapSize;
    size_t bytesPerRow;
    
    CGImageRef image = self.CGImage;
    
    size_t width = CGImageGetWidth(image);
    size_t height = CGImageGetHeight(image);
    
    bytesPerRow   = (width * 4);
    bitmapSize     = (bytesPerRow * height);
    
    bitmap = malloc( bitmapSize );
    if (bitmap == NULL)
    {
        return NULL;
    }
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        free(bitmap);
        return NULL;
    }
    
    CGBitmapInfo kBGRxBitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst;
    context = CGBitmapContextCreate (bitmap,
                                     width,
                                     height,
                                     8,
                                     bytesPerRow,
                                     colorSpace,
                                     kBGRxBitmapInfo);
    
    CGColorSpaceRelease( colorSpace );
    
    if (context == NULL)
    {
        free (bitmap);
        return NULL;
    }
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image);
    CGContextRelease(context);
    
    return bitmap;
}

/**拷贝图片
 */
- (UIImage*)deepCopy
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(floorf(self.size.width), floorf(self.size.height)), NO, 0.0f);
    
    [self drawAtPoint:CGPointMake(0, 0)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

/**通过给定颜色创建图片
 */
+ (UIImage*)imageWithColor:(UIColor*) color size:(CGSize) size
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.backgroundColor = color;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return retImage;
}

-(CGFloat)height{
    return self.size.height;
}

-(CGFloat)width{
    return self.size.width;
}

// Tint: Color
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color {
    return [self rt_tintedImageWithColor:color level:1.0f];
}

// Tint: Color + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color level:(CGFloat)level {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    return [self rt_tintedImageWithColor:color rect:rect level:level];
}

// Tint: Color + Rect
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect {
    return [self rt_tintedImageWithColor:color rect:rect level:1.0f];
}

// Tint: Color + Rect + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level {
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInRect:imageRect];
    
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextSetAlpha(ctx, level);
    CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    CGContextFillRect(ctx, rect);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *darkImage = [UIImage imageWithCGImage:imageRef
                                             scale:self.scale
                                       orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    return darkImage;
}

// Tint: Color + Insets
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets {
    return [self rt_tintedImageWithColor:color insets:insets level:1.0f];
}

// Tint: Color + Insets + level
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets level:(CGFloat)level {
    CGRect rect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    return [self rt_tintedImageWithColor:color rect:UIEdgeInsetsInsetRect(rect, insets) level:level];
}

// Light: Level
-(UIImage*)rt_lightenWithLevel:(CGFloat)level {
    return [self rt_tintedImageWithColor:[UIColor whiteColor] level:level];
}

// Light: Level + Insets
-(UIImage*)rt_lightenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets {
    return [self rt_tintedImageWithColor:[UIColor whiteColor] insets:insets level:level];
}

// Light: Level + Rect
-(UIImage*)rt_lightenRect:(CGRect)rect withLevel:(CGFloat)level {
    return [self rt_tintedImageWithColor:[UIColor whiteColor] rect:rect level:level];
}

// Dark: Level
-(UIImage*)rt_darkenWithLevel:(CGFloat)level {
    return [self rt_tintedImageWithColor:[UIColor blackColor] level:level];
}

// Dark: Level + Insets
-(UIImage*)rt_darkenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets {
    return [self rt_tintedImageWithColor:[UIColor blackColor] insets:insets level:level];
}

// Dark: Level + Rect
-(UIImage*)rt_darkenRect:(CGRect)rect withLevel:(CGFloat)level {
    return [self rt_tintedImageWithColor:[UIColor blackColor] rect:rect level:level];
}

-(UIImage *)stretchableImageWithEdgeInset:(UIEdgeInsets) inset{
    if([[UIDevice currentDevice].systemVersion floatValue]>=6.0)
        return [self resizableImageWithCapInsets:inset
                                    resizingMode:UIImageResizingModeStretch];
    else
        return [self resizableImageWithCapInsets:inset];
}

@end
