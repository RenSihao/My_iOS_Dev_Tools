//
//  NSMutableDictionary+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Category)

/**判断对象是否为空，才设置字典键值
 */
- (void)setObject:(id) object withKey:(id<NSCopying>) key;

@end
