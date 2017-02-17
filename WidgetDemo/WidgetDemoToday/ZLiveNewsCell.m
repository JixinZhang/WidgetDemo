//
//  ZLiveNewsCell.m
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "ZLiveNewsCell.h"
#import "WidgetDemoTodyDefine.h"

#define kContentLabelLeftGap 77.5f

@interface ZLiveNewsCell()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation ZLiveNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 102);
        self.backgroundColor = [UIColor clearColor];
        [self setupLiveCellView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 6, 35, 13)];
        _timeLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _timeLabel.font = [UIFont systemFontOfSize:13.0f];
        _timeLabel.text = @"17:28";;
    }
    return _timeLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kContentLabelLeftGap, 0, kScreenWidth - kContentLabelLeftGap - 15, 72)];
        _contentLabel.numberOfLines = 3;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.textAlignment = NSTextAlignmentNatural;
        _contentLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _contentLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _contentLabel;
}

- (void)setupLiveCellView {
    [self addSubview:self.timeLabel];
    [self addSubview:self.contentLabel];
    NSString *string = @"中国银行业者加强贸易放款攻势 瞄准新加坡中型贸易商媒体援引金属行业消息人士表示，中银国际、工行等中后面的是自己变得内容，五十三大幅拉升九分裤；了...";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    self.contentLabel.attributedText = attributedString;
}

@end
