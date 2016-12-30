//
//  UIViewController+SVP.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "UIViewController+SVP.h"

@implementation UIViewController (SVP)

#pragma mark - show

- (void)svp_show
{
    [SVProgressHUD show];
}
- (void)svp_showInfo:(NSString *)text
{
    [SVProgressHUD showInfoWithStatus:text];
}
- (void)svp_showSuccess:(NSString *)text
{
    [SVProgressHUD showSuccessWithStatus:text];
}
- (void)svp_showError:(NSString *)text;
{
    [SVProgressHUD showErrorWithStatus:text];
}
- (void)svp_showProgress:(CGFloat)progress status:(NSString *)status
{
    [SVProgressHUD showProgress:progress status:status];
}

#pragma mark - dismiss

- (void)svp_dismiss
{
    [self svp_dismissWithDelay:0 completion:nil];
}
- (void)svp_dismissWithDelay:(NSTimeInterval)delay
{
    [self svp_dismissWithDelay:delay completion:nil];
}
- (void)svp_dismissWithCompletion:(SVProgressHUDDismissCompletion)completion
{
    [self svp_dismissWithDelay:0 completion:completion];
}
- (void)svp_dismissWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion
{
    [SVProgressHUD dismissWithDelay:delay completion:completion];
}

@end



