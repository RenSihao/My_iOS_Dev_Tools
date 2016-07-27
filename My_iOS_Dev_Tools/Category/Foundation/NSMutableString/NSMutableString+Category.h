//
//  NSMutableString+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (Category)

/**
 *  移除最后一个字符
 */
- (void)removeLastCharacter;

/**
 *  移除给定的结尾字符串
 *
 *  @param str
 */
- (void)removeLastStringWithString:(NSString*)str;

@end
