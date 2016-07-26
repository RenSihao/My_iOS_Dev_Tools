//
//  AppMacros.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/11.
//  Copyright © 2016年 RenSihao. All rights reserved.
//


/**
 *  AppMacros 是APP常用宏定义文件，宏定义一般用来定义代码行为
 */

#ifndef AppMacros_h
#define AppMacros_h


#define WeakSelf(parameter)   typeof(self) __weak   weakSelf   = parameter;
#define StrongSelf(parameter) typeof(self) __strong strongSelf = parameter;


#define IsEmpty(parameter) !(parameter && parameter.length>0)
#define IsNull(parameter)   [parameter isKindOfClass:[NSNull class]]







#endif
