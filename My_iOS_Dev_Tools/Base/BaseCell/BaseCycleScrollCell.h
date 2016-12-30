//
//  BaseCycleScrollCell.h
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

@class BaseCycleScrollCell;
@protocol BaseCycleScrollCellDelegate <NSObject>
@optional

/** 点击图片回调 */
- (void)cycleScrollCell:(BaseCycleScrollCell *)cycleScrollCell didSelectItemAtIndex:(NSInteger)index;

/** 图片滚动回调 */
- (void)cycleScrollCell:(BaseCycleScrollCell *)cycleScrollCell didScrollToIndex:(NSInteger)index;

@end


@interface BaseCycleScrollCell : UITableViewCell

/** delegate */
@property (nonatomic, weak) id <BaseCycleScrollCellDelegate> delegate;

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;

@end


