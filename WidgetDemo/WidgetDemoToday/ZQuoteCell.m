//
//  ZQuoteCell.m
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "ZQuoteCell.h"
#import "WidgetDemoTodyDefine.h"

#define kProLabelWidth (kScreenWidth - 15 * 2) / 2.0

@interface ZQuoteCell()

@property (nonatomic, strong) UILabel *productNameLabel;
@property (nonatomic, strong) UILabel *updatedAtLabel;
@property (nonatomic, strong) UILabel *lastPxLabel;
@property (nonatomic, strong) UILabel *changeLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZQuoteCell

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 78);
        self.backgroundColor = [UIColor clearColor];
        [self setupQuoteCellView];
        [self addTouchEvent];
    }
    return self;
}

- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        _productNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, kProLabelWidth, 16)];
        _productNameLabel.font = [UIFont systemFontOfSize:16.0f];
        _productNameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    return _productNameLabel;
}

- (UILabel *)updatedAtLabel {
    if (!_updatedAtLabel) {
        _updatedAtLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 46, 90, 12)];
        _updatedAtLabel.font = [UIFont systemFontOfSize:12.0f];
        _updatedAtLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];/* #666666 */
    }
    return _updatedAtLabel;
}

- (UILabel *)lastPxLabel {
    if (!_lastPxLabel) {
        _lastPxLabel = [[UILabel alloc] initWithFrame:CGRectMake(15 + kProLabelWidth, 20, kProLabelWidth, 16)];
        _lastPxLabel.font = [UIFont systemFontOfSize:16.0f];
        _lastPxLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];/* #333333 */
        _lastPxLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return _lastPxLabel;
}

- (UILabel *)changeLabel {
    if (!_changeLabel) {
        _changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 15 - 150, 46, 150, 12)];
        _changeLabel.font = [UIFont systemFontOfSize:12.0f];
        _changeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _changeLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 77, kScreenWidth - 15 * 2, 1)];
        _lineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return _lineView;
}

- (void)setupQuoteCellView {
    self.productNameLabel.text = @"恒生指数";
    self.updatedAtLabel.text = @"14:20:03 更新";
    self.lastPxLabel.text = @"23407.05";
    self.changeLabel.text = @"-142.47 (-0.60%)";
    [self addSubview:self.productNameLabel];
    [self addSubview:self.updatedAtLabel];
    [self addSubview:self.lastPxLabel];
    [self addSubview:self.changeLabel];
    [self addSubview:self.lineView];
}

- (void)addTouchEvent {
    
}

@end
