//
//  progressView.m
//  nav
//
//  Created by kongpeng on 15/5/15.
//  Copyright (c) 2015年 erlinyou.com. All rights reserved.
//

#import "progressView.h"

@implementation progressView
- (void)setValue:(CGFloat)value
{
    _value = value/100.0;
    [self setNeedsDisplay];//向当前对象请求重绘
}

- (void)setMyProgressType:(progressType)myProgressType
{
    _myProgressType = myProgressType;
    [self setNeedsDisplay];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    switch (self.myProgressType) {
        case lineProgressType:
            [self createLineProgress];
            break;
        default:
            [self createCircularAndSquareWithRect:rect];
            break;
    }

}

- (void)createLineProgress
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint bp = CGPointMake(self.bounds.size.width/2, self.bounds.size.height);
    CGPoint ep = CGPointMake(self.bounds.size.width/2, (1-_value)*self.bounds.size.height);
    [path moveToPoint:bp];
    [path addLineToPoint:ep];
    if (self.color) {
        [self.color setStroke];
    }else{
        [[UIColor colorWithRed:255/255.0 green:90/255.0 blue:0/255.0 alpha:1.0]setStroke];
    }
    path.lineWidth = self.bounds.size.width;
    [path stroke];
}

- (void)createCircularAndSquareWithRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    CGFloat startAngle;
    CGFloat endAgle = - M_PI * 0.5 + self.value * M_PI * 2 + 0.001;
    CGFloat lineToPointX;
    
    CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5);
    
//    [[UIColor lightGrayColor] set];
    CGFloat w = radius * 2;
    CGFloat h = w;
    CGFloat x = (rect.size.width - w) * 0.5;
    CGFloat y = (rect.size.height - h) * 0.5;
    
    switch (self.myProgressType) {
        case circularProgressType:
        {
            // 背景圆
            startAngle = - M_PI * 0.5;
            lineToPointX = xCenter;
            CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
        }
            break;
        case squareProgressType:
        {
            // 背景方形
            startAngle = - M_PI * 0.75;
            lineToPointX = 0;
            radius *= 1.5;
            endAgle = - M_PI * 0.75 + self.value * M_PI * 2 + 0.001;
            
            CGContextMoveToPoint(ctx, 0, w*0.1);  // 开始坐标右边开始
            CGContextAddArcToPoint(ctx, 0, 0, w*0.1, 0, w*0.05);  // 右下角角度
            CGContextAddArcToPoint(ctx, w, 0, w, w*0.1, w*0.05); // 左下角角度
            CGContextAddArcToPoint(ctx, w, w, w*0.9, w, w*0.05); // 左上角
            CGContextAddArcToPoint(ctx, 0, w, 0, w*0.9, w*0.05); // 右上角
            CGContextClosePath(ctx);
        }
            break;
        case triangleProgressType:
        {
            //背景三角
            startAngle = - M_PI * 0.5;
            radius *= 1.5;
            lineToPointX = xCenter;
            
            CGContextMoveToPoint(ctx, w*0.45, w*0.15);  // 开始坐标右边开始
            CGContextAddArcToPoint(ctx, w*0.5, 0, w*0.55, w*0.15, w*0.05);  // 右下角角度
            CGContextAddArcToPoint(ctx, w*0.95, w*0.85, w*0.85, w*0.85, w*0.05); // 左下角角度
            CGContextAddArcToPoint(ctx, 0, w*0.85,w*0.05, w*0.8, w*0.05); // 左上角
            CGContextClosePath(ctx);
            
        }
            break;
        default:
            radius = 0;
            break;
    }
    CGContextClip(ctx);
    

    
    // 进程圆
    [[UIColor colorWithRed:255/255.0 green:90/255.0 blue:0/255.0 alpha:1] set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, lineToPointX, 0);
    CGContextAddArc(ctx, xCenter, yCenter, radius, startAngle, endAgle, 0);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
    
    [[UIColor lightGrayColor] set];
    CGContextMoveToPoint(ctx, xCenter, yCenter);
    CGContextAddLineToPoint(ctx, lineToPointX, 0);
    CGContextAddArc(ctx, xCenter, yCenter, radius, startAngle, endAgle, 1);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
}



@end
