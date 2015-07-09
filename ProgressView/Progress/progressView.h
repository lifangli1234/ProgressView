//
//  progressView.h
//  nav
//
//  Created by kongpeng on 15/5/15.
//  Copyright (c) 2015年 erlinyou.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, progressType) {
    lineProgressType,
    circularProgressType,
    squareProgressType,
    triangleProgressType
};
@interface progressView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGFloat value;
@property (nonatomic) progressType myProgressType;
@end
