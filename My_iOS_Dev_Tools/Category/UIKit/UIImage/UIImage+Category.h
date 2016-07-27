//
//  UIImage+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

//图片等比例缩小方式
typedef NS_ENUM(NSInteger, SeaImageShrinkType){
    SeaImageShrinkTypeWidthAndHeight = 0, //宽和高
    SeaImageShrinkTypeWidth = 1, //宽
    SeaImageShrinkTypeHeight = 2, //高
};

/**从资源文件中获取图片的选项
 */
typedef NS_ENUM(NSInteger, SeaAssetImageOptions)
{
    SeaAssetImageOptionsFullScreenImage = 0, ///适合当前屏幕大小的图片
    SeaAssetImageOptionsResolutionImage = 1, ///完整的图片
};

@interface UIImage (Category)



#pragma mark- init

/**图片初始化 png格式 使用initWithContentsOfFile
 *@param name 图片名称
 *@return 一个初始化的UIImage
 */
+ (UIImage*)bundleImageWithName:(NSString*) name;


/**从图片资源中获取图片数据
 *@return [UIImage imageFromAsset:asset options:SeaAssetImageOptionsResolutionImage];
 */
+ (UIImage*)imageFromAsset:(ALAsset *)asset;

/**从图片资源中获取图片数据
 *@param asset 资源文件类
 *@param options 从资源文件中获取图片的选项
 */
+ (UIImage*)imageFromAsset:(ALAsset*) asset options:(SeaAssetImageOptions) options;

#pragma mark- resize

/**等比例缩小图片
 *@param size 要缩小的图片最大尺寸
 *@param type 缩小方式
 *@return 返回要缩小的图片尺寸
 */
- (CGSize)shrinkWithSize:(CGSize) size type:(SeaImageShrinkType) type;

/**等比例缩小图片
 *@param imageSize 要缩小的图片大小
 *@param size 要缩小的图片最大尺寸
 *@param type 缩小方式
 *@return 返回要缩小的图片尺寸
 */
+ (CGSize)shrinkImageSize:(CGSize) imageSize withSize:(CGSize) size type:(SeaImageShrinkType) type;

/**通过给定大小获取图片的等比例缩小的缩率图
 *@param size 目标图片大小
 *@return 图片的缩略图
 */
- (UIImage*)aspectFitthumbnailWithSize:(CGSize) size;

/**居中截取的缩略图
 *@param size 目标图片大小
 *@return 图片的缩略图
 */
- (UIImage*)aspectFillThumbnailWithSize:(CGSize) size;

/**截取图片
 *@param rect 要截取的rect
 *@return 截取的图片
 */
- (UIImage*)subImageWithRect:(CGRect) rect;

/**重绘图片
 *@return 重绘后的图片
 */
- (UIImage*)redraw;

/**获取一个圆形图片
 *@param color 图片圆形边框颜色
 *@param borderWidth 图片圆形边框线条宽度
 *@param padding 圆形图片的边距
 *@return 一个圆形图片
 */
- (UIImage*)circleImageWithBorderColor:(UIColor*) color borderWidth:(CGFloat) borderWidth innerPadding:(CGFloat) padding;

/**把UIImage轉成bitmap 需要调用free(),避免内存泄露
 */
- (unsigned char *)createRGBABitmap;

/**拷贝图片
 */
- (UIImage*)deepCopy;

/**通过给定颜色创建图片
 */
+ (UIImage*)imageWithColor:(UIColor*) color size:(CGSize) size;


@property (nonatomic,readonly) CGFloat width;
@property (nonatomic,readonly) CGFloat height;

-(UIImage*)rt_tintedImageWithColor:(UIColor*)color;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color level:(CGFloat)level;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets;
-(UIImage*)rt_tintedImageWithColor:(UIColor*)color insets:(UIEdgeInsets)insets level:(CGFloat)level;

-(UIImage*)rt_lightenWithLevel:(CGFloat)level;
-(UIImage*)rt_lightenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)rt_lightenRect:(CGRect)rect withLevel:(CGFloat)level;

-(UIImage*)rt_darkenWithLevel:(CGFloat)level;
-(UIImage*)rt_darkenWithLevel:(CGFloat)level insets:(UIEdgeInsets)insets;
-(UIImage*)rt_darkenRect:(CGRect)rect withLevel:(CGFloat)level;

// ios6.0以拉伸方式放大
-(UIImage *)stretchableImageWithEdgeInset:(UIEdgeInsets)inset;

@end
