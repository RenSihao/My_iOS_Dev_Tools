//
//  NSDecimalNumber+Category.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/7/28.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "NSDecimalNumber+Category.h"

//@implementation NSDecimalNumber


//- (NSDecimalNumber *)roundToScale:(NSUInteger)scale {
//    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:NSRoundPlain scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
//    return [self decimalNumberByRoundingAccordingToBehavior:handler];
//}
//
//- (NSDecimalNumber*)decimalNumberWithPercentage:(float)percent {
//    NSDecimalNumber * percentage = [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithFloat:percent] decimalValue]];
//    return [self decimalNumberByMultiplyingBy:percentage];
//}
//
//- (NSDecimalNumber *)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage {
//    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
//    NSDecimalNumber * percent = [self decimalNumberByMultiplyingBy:[discountPercentage decimalNumberByDividingBy:hundred]];
//    return [self decimalNumberBySubtracting:percent];
//}
//
//- (NSDecimalNumber *)decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale {
//    NSDecimalNumber * value = [self decimalNumberWithDiscountPercentage:discountPercentage];
//    return [value roundToScale:scale];
//}
//
//- (NSDecimalNumber *)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue {
//    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
//    NSDecimalNumber * percentage = [[self decimalNumberByDividingBy:baseValue] decimalNumberByMultiplyingBy:hundred];
//    return [hundred decimalNumberBySubtracting:percentage];
//}
//
//- (NSDecimalNumber *)discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale {
//    NSDecimalNumber * discount = [self discountPercentageWithBaseValue:baseValue];
//    return [discount roundToScale:scale];
//}


//@end