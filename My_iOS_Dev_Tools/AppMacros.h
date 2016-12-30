//
//  AppMacros.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//


/**
 *  AppMacros 是APP常用宏定义文件，宏定义一般用来定义代码行为（众所周知，项目里我们尽可能不去用宏 -。-）
 */

#ifndef AppMacros_h
#define AppMacros_h

//self弱引用
//#define WeakSelf(parameter)   typeof(self) __weak   weakSelf   = parameter;

//self强引用
//#define StrongSelf(parameter) typeof(self) __strong strongSelf = parameter;


#pragma mark - 尺寸
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#pragma mark - 颜色

#pragma mark - 图片







#endif
