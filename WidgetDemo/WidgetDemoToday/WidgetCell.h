//
//  WidgetCell.h
//  WidgetDemo
//
//  Created by ZhangBob on 16/02/2017.
//  Copyright © 2017 wallstreetcn.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidgetCell : UIView

@property (nonatomic, copy) void (^widgetCellBlock)(id);

@end
