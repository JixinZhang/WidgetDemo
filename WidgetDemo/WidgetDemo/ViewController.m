//
//  ViewController.m
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(15, 64, 320, 320)];
        _label.font = [UIFont systemFontOfSize:15.0f];
        _label.text = @"华尔街见闻";
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateLabelText:)
                                                 name:@"ExtenicationNotification"
                                               object:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabelText:(NSNotification *)notification {
    NSURL *url = notification.object;
    self.label.text = url.absoluteString;
}


@end
