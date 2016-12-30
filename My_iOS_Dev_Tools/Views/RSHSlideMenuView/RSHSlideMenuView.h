//
//  RSHSlideMenuView.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/20.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SlideMenuClickBlock)(NSInteger index, NSString *title, NSInteger count);

// 侧滑功能栏View
@interface RSHSlideMenuView : UIView

@property (nonatomic, copy) SlideMenuClickBlock clickBlock;

- (instancetype)initWithTitles:(NSArray *)titles;

- (instancetype)initWithTitles:(NSArray *)titles
                  buttonHeight:(CGFloat)btnHeight
                     menuColor:(UIColor *)color
           backgroundBlurColor:(UIBlurEffectStyle)style;

- (void)show;
- (void)dismiss;
@end


