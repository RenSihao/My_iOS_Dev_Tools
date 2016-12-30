//
//  BaseCycleScrollView.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

@class BaseCycleScrollView;
@protocol BaseCycleScrollViewDelegate <NSObject>
@optional

/** 点击图片回调 */
- (void)cycleScrollView:(BaseCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

/** 图片滚动回调 */
- (void)cycleScrollView:(BaseCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;

@end


@interface BaseCycleScrollView : UIView

@property (nonatomic, weak) id <BaseCycleScrollViewDelegate> delegate;

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;

@end
