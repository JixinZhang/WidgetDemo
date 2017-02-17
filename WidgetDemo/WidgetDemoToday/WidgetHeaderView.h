//
//  WidgetHeaderView.h
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidgetHeaderView : UIView

@property (nonatomic, copy) void (^widgetHeaderBlock)(NSInteger);

- (void)setHeaderButtonSelected:(NSInteger) index;

@end
