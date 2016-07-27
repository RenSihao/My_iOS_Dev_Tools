//
//  UIButton+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/22.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

- (void)setWhiteStyle
{
    UIEdgeInsets inset = UIEdgeInsetsMake(10,10,10,10);
    UIImage *button_norm = [[UIImage imageNamed:@"button_white_norm"]
                            resizableImageWithCapInsets:inset];
    //    [self.titleLabel setFont:[UIFont systemFontOfSize:TextSizeMedium]];
    //    [self setTitleColor:parseColor(WESTORE_PRIMARY_TEXTCOLOR)
    //               forState:UIControlStateNormal];
    [self setBackgroundImage:button_norm
                    forState:UIControlStateNormal];
}

- (void)setPinkStyle
{
    UIEdgeInsets inset = UIEdgeInsetsMake(10,10,10,10);
    
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateHighlighted];
    //    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:TextSizeLarge]];
    //    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
}
- (void)setLoginStyle
{
    UIEdgeInsets inset = UIEdgeInsetsMake(10,10,10,10);
    
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateHighlighted];
    //    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:TextSizeLarge]];
    //    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
}
- (void)setPinkStyleWithSmallCorner
{
    //    UIEdgeInsets inset = UIEdgeInsetsMake(10,10,10,10);
    //    UIImage *button_norm = [[UIImage imageNamed:@"button_pink_small_radius_norm"]
    //                            resizableImageWithCapInsets:inset];
    //    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:TextSizeMedium]];
    //    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
    //    [self setBackgroundImage:button_norm forState:UIControlStateNormal];
    
    
    UIEdgeInsets inset = UIEdgeInsetsMake(10,10,10,10);
    
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"navigation_bar"] resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch]
                    forState:UIControlStateHighlighted];
    //    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:TextSizeLarge]];
    //    [self setTitleColor:WhiteColor forState:UIControlStateNormal];
    [self.layer setCornerRadius:6];
    [self.layer setMasksToBounds:YES];
}
@end
