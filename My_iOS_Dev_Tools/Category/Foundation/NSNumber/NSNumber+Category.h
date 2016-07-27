//
//  NSNumber+Category.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/27.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Category)

- (BOOL)isValidate;

/* 展示 */
- (NSString*)toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)toDisplayPercentageWithDigit:(NSInteger)digit;

/*　四舍五入 */
- (NSNumber*)doRoundWithDigit:(NSUInteger)digit;
- (NSNumber*)doCeilWithDigit:(NSUInteger)digit;
- (NSNumber*)doFloorWithDigit:(NSUInteger)digit;
@end

@interface NSDecimalNumber (Category)

- (NSDecimalNumber*)roundToScale:(NSUInteger)scale;
- (NSDecimalNumber*)decimalNumberWithPercentage:(float)percent;
- (NSDecimalNumber*)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage;
- (NSDecimalNumber*)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale;
- (NSDecimalNumber*)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue;
- (NSDecimalNumber*)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale;
@end