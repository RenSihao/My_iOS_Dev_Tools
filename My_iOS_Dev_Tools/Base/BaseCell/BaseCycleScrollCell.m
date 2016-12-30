//
//  BaseCycleScrollCell.m
//  My_iOS_Dev_Tools
//
//  Created by RenSihao on 16/12/14.
//  Copyright © 2016年 RenSihao. All rights reserved.
//

#import "BaseCycleScrollCell.h"

@interface BaseCycleScrollCell ()
<
SDCycleScrollViewDelegate
>

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end

@implementation BaseCycleScrollCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 点击无阴影
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        // 移除分割线
        self.separatorInset = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
        self.layoutMargins = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
        
        // add scrollView
        [self.contentView addSubview:self.scrollView];
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
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollCell:self didSelectItemAtIndex:index];
    }
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(cycleScrollCell:didScrollToIndex:)]) {
        [self.delegate cycleScrollCell:self didScrollToIndex:index];
    }
}

#pragma mark - getter

- (SDCycleScrollView *)scrollView
{
    if (!_scrollView) {
        CGRect frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.bounds.size.height);
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:frame
                                                         delegate:self
                                                 placeholderImage:[UIImage imageNamed:@""]];
        
    }
    return _scrollView;
}
@end
