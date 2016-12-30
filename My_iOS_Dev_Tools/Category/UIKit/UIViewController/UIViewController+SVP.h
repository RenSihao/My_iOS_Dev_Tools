//
//  UIViewController+SVP.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SVProgressHUD/SVProgressHUD.h>

/*
 1、全局VC所有的SVP提示全部写在这里，方便统一修改
 2、程序启动后记得设置SVP全局外观属性
 */
@interface UIViewController (SVP)

- (void)svp_show;
- (void)svp_showInfo:(NSString *)text;
- (void)svp_showSuccess:(NSString *)text;
- (void)svp_showError:(NSString *)text;
- (void)svp_showProgress:(CGFloat)progress status:(NSString *)status;

- (void)svp_dismiss;
- (void)svp_dismissWithDelay:(NSTimeInterval)delay;
- (void)svp_dismissWithCompletion:(SVProgressHUDDismissCompletion)completion;
- (void)svp_dismissWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion;

@end


