//
//  RSAVC.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/11/28.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "RSAVC.h"

@interface RSAVC ()

@end

@implementation RSAVC

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

@end
