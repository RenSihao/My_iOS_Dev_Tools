//
//  RSHUrlArgumentsFilter.h
//  RSHNetwork
//
//  Created by RenSihao on 16/11/21.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"
#import "YTKBaseRequest.h"

/**
 *  给url追加arguments，用于全局参数，比如AppVersion, ApiVersion等
 */
@interface RSHUrlArgumentsFilter : NSObject <YTKUrlFilterProtocol>

+ (instancetype)filterWithArguments:(NSDictionary *)arguments;

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;
@end
