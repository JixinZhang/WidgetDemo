//
//  TodayViewController.m
//  WidgetDemoToday
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "WidgetDemoTodyDefine.h"
#import "WidgetHeaderView.h"
#import "WidgetCell.h"
#import "ZLiveNewsCell.h"


@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) WidgetHeaderView *headerView;
@property (nonatomic, strong) UIView *tableView;
@property (nonatomic, strong) WidgetCell *newsCell;
@property (nonatomic, strong) ZLiveNewsCell *liveCell;

@end

@implementation TodayViewController

- (WidgetHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[WidgetHeaderView alloc] init];
        __weak typeof (self)weakSelf = self;
        _headerView.widgetHeaderBlock = ^(NSInteger index) {
            [weakSelf setupTableViewWith:index];
        };
    }
    return _headerView;
}

- (UIView *)tableView {
    if (!_tableView) {
        _tableView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth, 440)];
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.headerView setHeaderButtonSelected:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        self.preferredContentSize = CGSizeMake(kScreenWidth, 520);
        [self setupNewsTableView];
    } else {
        self.preferredContentSize = CGSizeMake(kScreenWidth, 81.5);
        [self.tableView removeFromSuperview];
    }
}

- (void)setupNewsTableView {
    [self.tableView removeFromSuperview];
    for (UIView *view in [self.tableView subviews]) {
        [view removeFromSuperview];
    }
    __weak typeof (self)weakSelf = self;
    for (NSInteger i = 0; i < 4; i++) {
        WidgetCell *newsCell = [[WidgetCell alloc] init];
        newsCell.frame = CGRectMake(0, 110 * i, kScreenWidth, 110);
        newsCell.widgetCellBlock = ^(NSString *string) {
            NSLog(@"%@",string);
            NSURL *url = [NSURL URLWithString:string];
            [weakSelf.extensionContext openURL:url completionHandler:^(BOOL success) {
                
            }];
        };
        [self.tableView addSubview:newsCell];
    }
    [self.view addSubview:self.tableView];
}

- (void)setupLiveTableView {
    [self.tableView removeFromSuperview];
    for (UIView *view in [self.tableView subviews]) {
        [view removeFromSuperview];
    }
    for (NSInteger i = 0; i < 4; i++) {
        ZLiveNewsCell *liveNewsCell = [[ZLiveNewsCell alloc] init];
        liveNewsCell.frame = CGRectMake(0, 102 * i, kScreenWidth, 102);
        [self.tableView addSubview:liveNewsCell];
    }
    [self.view addSubview:self.tableView];
}

- (void)setupQuoteTableView {
    [self.tableView removeFromSuperview];
    for (UIView *view in [self.tableView subviews]) {
        [view removeFromSuperview];
    }
}

- (void)setupCalendarTableView {
    [self.tableView removeFromSuperview];
    for (UIView *view in [self.tableView subviews]) {
        [view removeFromSuperview];
    }
}

- (void)setupTableViewWith:(NSInteger )index {
    switch (index) {
        case 0:
            [self setupNewsTableView];
            break;
        case 1:
            [self setupLiveTableView];
            break;
        case 2:
            [self setupQuoteTableView];
            break;
        case 3:
            [self setupCalendarTableView];
            break;
            
        default:
            break;
    }
}

@end
