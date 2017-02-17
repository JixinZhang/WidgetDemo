//
//  ZCalendarCell.m
//  WidgetDemo
//
//  Created by ZhangBob on 17/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "ZCalendarCell.h"

@implementation ZCalendarCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCalendarCell];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupCalendarCell {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 70, 15)];
    self.label.textColor = [UIColor redColor];
    [self addSubview:self.label];
}

@end
