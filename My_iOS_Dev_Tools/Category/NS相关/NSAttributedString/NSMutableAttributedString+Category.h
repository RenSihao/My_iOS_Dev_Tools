//
//  NSMutableAttributedString+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Category)

/**
*  获取富文本框size
*
*  @param width 每行最大宽度
*
*  @return 富文本框size
*/
- (CGSize)boundsWithWidth:(CGFloat)width;
@end
