//
//  BaseCycleScrollView.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseCycleScrollView.h"

@interface BaseCycleScrollView ()
<
SDCycleScrollViewDelegate
>

@property (nonatomic, strong) SDCycleScrollView *scrollView;
@end

@implementation BaseCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // add scrollView
        [self addSubview:self.scrollView];
    }
    return self;
}
#pragma mark - 配置数据源

- (void)setTitlesGroup:(NSArray *)titlesGroup
{
    if ([_titlesGroup isEqualToArray:titlesGroup]) {
        return ;
    }
    
    _titlesGroup = titlesGroup;
    self.scrollView.titlesGroup = _titlesGroup;
}
- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup
{
    if ([_imageURLStringsGroup isEqualToArray:imageURLStringsGroup]) {
        return ;
    }
    
    _imageURLStringsGroup = imageURLStringsGroup;
    self.scrollView.imageURLStringsGroup = _imageURLStringsGroup;
}
- (void)setLocalizationImageNamesGroup:(NSArray *)localizationImageNamesGroup
{
    if ([_localizationImageNamesGroup isEqualToArray:localizationImageNamesGroup]) {
        return ;
    }
    
    _localizationImageNamesGroup = localizationImageNamesGroup;
    self.scrollView.localizationImageNamesGroup = _localizationImageNamesGroup;
}

#pragma mark - SDCycleScrollViewDelegate

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollView:self didSelectItemAtIndex:index];
    }
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cycleScrollView:didScrollToIndex:)]) {
        [self.delegate cycleScrollView:self didScrollToIndex:index];
    }
}

#pragma mark - getter

- (SDCycleScrollView *)scrollView
{
    if (!_scrollView) {
        CGRect frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame
                                                         delegate:self
                                                 placeholderImage:[UIImage imageNamed:@""]];
    }
    return _scrollView;
}



@end
