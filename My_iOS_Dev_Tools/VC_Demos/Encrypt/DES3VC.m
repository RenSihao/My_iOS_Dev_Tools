//
//  DES3VC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/28.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "DES3VC.h"
#import "DES3.h"

@interface DES3VC ()

@property (nonatomic, strong) UITextView *originTextView;
@property (nonatomic, strong) UITextView *encryptTextView;
@property (nonatomic, strong) UITextView *decryptTextView;
@end

@implementation DES3VC

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"%s", __func__);
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"";
    
    
    
    
    
    
}

#pragma mark - getter

- (UITextView *)originTextView
{
    if (!_originTextView) {
        _originTextView = [UITextView new];
    }
    return _originTextView;
}



























@end
