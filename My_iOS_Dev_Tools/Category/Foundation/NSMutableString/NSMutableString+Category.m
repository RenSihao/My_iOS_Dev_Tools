//
//  NSMutableString+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/8.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSMutableString+Category.h"

@implementation NSMutableString (Category)

- (void)removeLastCharacter
{
    if(self.length == 0)
    {
        return;
    }
    
    [self deleteCharactersInRange:NSMakeRange(self.length - 1, 1)];
}

- (void)removeLastStringWithString:(NSString*)str
{
    if(self.length < str.length)
    {
        return ;
    }
    [self deleteCharactersInRange:NSMakeRange(self.length - str.length, str.length)];
}
@end
