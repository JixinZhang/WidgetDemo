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
#import "ZQuoteCell.h"
#import "ZCalendarCell.h"

@interface TodayViewController () <NCWidgetProviding,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) WidgetHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WidgetCell *newsCell;
@property (nonatomic, strong) ZLiveNewsCell *liveCell;
@property (nonatomic, strong) ZQuoteCell *quoteCell;

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

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth, 440)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headerView];
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.wallstreetcn.ExtensionDemo"];
    NSNumber *widgetChannel = [userDefaults valueForKey:@"widgetChannel"];
    [self.headerView setHeaderButtonSelected:widgetChannel.integerValue];
    
    if (kSysOversion >= 10.0) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    } else {
        self.preferredContentSize = CGSizeMake(kScreenWidth, 520);
        [self setupTableViewWith:widgetChannel.integerValue];
    }
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
        NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.wallstreetcn.ExtensionDemo"];
        NSNumber *widgetChannel = [userDefaults valueForKey:@"widgetChannel"];
        [self setupTableViewWith:widgetChannel.integerValue];
    } else {
        self.preferredContentSize = CGSizeMake(kScreenWidth, 81.5);
        [self.tableView removeFromSuperview];
    }
    NSLog(@"%ld",(long)self.extensionContext.widgetActiveDisplayMode);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)setupTableViewWith:(NSInteger )index {
    if (kSysOversion >= 10.0) {
        if (self.extensionContext.widgetActiveDisplayMode == NCWidgetDisplayModeCompact) {
            return;
        }
    }
    self.tableView.tag = 100 + index;
    [self.tableView removeFromSuperview];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag == 102) {
        return 5;
    } else {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (tableView.tag) {
        case 100:
            return 110.0f;
            break;
        case 101:
            return 102.0f;
            break;
        case 102:
            return 78.0f;
            break;
        case 103:
            return 75.0f;
            break;
    }
    return 110.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"CellIdentifier";
    if (tableView.tag == 100) {
        WidgetCell *cell = [[WidgetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        return cell;
    } else if (tableView.tag == 101) {
        ZLiveNewsCell *liveNewsCell = [[ZLiveNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        return liveNewsCell;
    } else if (tableView.tag == 102) {
        ZQuoteCell *quoteCell = [[ZQuoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        quoteCell.frame = CGRectMake(0, 78 * i - 5, kScreenWidth, 78);
        return quoteCell;
    } else {
        ZCalendarCell *cell = [[ZCalendarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *string = @"wscnWidget://wallstreetcn.com";
    if (tableView.tag == 101) {
        string = @"wscnWidget://live.wallstreetcn.com";
    } else if (tableView.tag == 102) {
        string = @"wscnWidget://quote.wallstreetcn.com";
    } else if (tableView.tag == 103) {
        string = @"wscnWidget://calendar.wallstreetcn.com";
    }
    NSURL *url = [NSURL URLWithString:string];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

@end
