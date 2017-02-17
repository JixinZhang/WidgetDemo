//
//  WidgetCell.m
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "WidgetCell.h"
#import "WidgetDemoTodyDefine.h"

@interface WidgetCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation WidgetCell

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 110);
        self.backgroundColor = [UIColor clearColor];
        [self setupWidgetCellView];
        [self addTouchEvent];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, kScreenWidth - 15 * 2 - 80 - 14, 48)];
        _titleLabel.textColor = [UIColor colorWithRed:32/255.0 green:32/255.0 blue:32/255.0 alpha:1];
        _titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.text = @"周小川：中国银行体系不良贷款上升但风险可控，后面的就是我开始胡说的内容了，作为测试。开心就好";
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 73, 200, 12)];
        _subTitleLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        _subTitleLabel.font = [UIFont systemFontOfSize:12.0f];
        _subTitleLabel.text = @"5小时前／华尔街见闻";
    }
    return _subTitleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 15 - 80, 15, 80, 80)];
        _imageView.image = [UIImage imageNamed:@"quote_web_sina"];
    }
    return _imageView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 109, kScreenWidth - 15 * 2, 1)];
        _lineView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    }
    return _lineView;
}

- (void)setupWidgetCellView {
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    [self addSubview:self.imageView];
    [self addSubview:self.lineView];
}

- (void)addTouchEvent {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(widgetCellTapped:)];
    [self addGestureRecognizer:tapGesture];
}

- (IBAction)widgetCellTapped:(id)sender {
    if (self.widgetCellBlock) {
        self.widgetCellBlock(@"wscnWidget://wallstreetcn.com");
    }
}

@end
