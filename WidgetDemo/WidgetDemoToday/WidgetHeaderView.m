//
//  WidgetHeaderView.m
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "WidgetHeaderView.h"
#import "WidgetDemoTodyDefine.h"

@interface WidgetHeaderView()

@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (nonatomic, strong) UIButton *newsButton;
@property (nonatomic, strong) UIButton *liveButton;
@property (nonatomic, strong) UIButton *quoteButton;
@property (nonatomic, strong) UIButton *calendarButton;
@end

#define kLeftGap 20.0f
#define kButtonWidth 55.0f
#define kButtonMargin (kScreenWidth - kLeftGap * 2 - kButtonWidth * 4) / 3.0f

@implementation WidgetHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 81.5);
//        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        [self setupWidgetHeaderView];
    }
    return self;
}

- (void)setupWidgetHeaderView {
    self.buttonArray = [NSMutableArray array];
    NSArray *imageArr = @[[UIImage imageNamed:@"news"],
                          [UIImage imageNamed:@"live"],
                          [UIImage imageNamed:@"quote"],
                          [UIImage imageNamed:@"calendar"]];
    for (NSUInteger i = 0; i < imageArr.count; i++) {
        UIButton *button = [self headerButtonWithImage:imageArr[i]];
        button.center = CGPointMake(kLeftGap + (kButtonMargin + kButtonWidth) * i + kButtonWidth / 2.0f, 20 + 22.5);
        button.tag = 100 + i;
        [button addTarget:self
                   action:@selector(headerButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArray addObject:button];
    }
    
}

- (UIButton *)headerButtonWithImage:(UIImage *)image {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kButtonWidth, kButtonWidth);
    button.backgroundColor = [UIColor clearColor];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"manager"] forState:UIControlStateSelected];
    return button;
}

- (void)setHeaderButtonSelected:(NSInteger) index {
    if (self.buttonArray.count == 0) {
        return;
    }
    for (UIButton *button in self.buttonArray) {
        button.selected = NO;
    }
    UIButton *selectedButton = self.buttonArray[index];
    selectedButton.selected = YES;
}

- (IBAction)headerButtonClicked:(UIButton *)button {
    NSInteger index = button.tag - 100;
    [self setHeaderButtonSelected:index];
    if (self.widgetHeaderBlock) {
        self.widgetHeaderBlock(index);
    }
}


@end
