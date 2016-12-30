//
//  QQZonePopMenuView.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/16.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

// 类似QQ空间cell的向下箭头弹出控件
@interface QQZonePopMenuView : UIView

+ (instancetype)sharedInstance;
+ (void)showFromView:(UIView *)from titles:(NSArray *)titles;
- (void)showFromView:(UIView *)from titles:(NSArray *)titles;
@end
