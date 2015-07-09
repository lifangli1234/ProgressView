//
//  ViewController.m
//  ProgressView
//
//  Created by lifangli on 15/7/9.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    value = 0.0;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(valueChanged:) userInfo:nil repeats:YES];
    _progressView.value = value;
    self.cricularImg.layer.cornerRadius = 65;
    self.cricularProgressView.value = value;
    self.cricularProgressView.myProgressType = circularProgressType;
    self.triangelProgressView.myProgressType = triangleProgressType;
    self.squareProgressView.myProgressType = squareProgressType;
    self.triangelProgressView.value = value;
    self.squareProgressView.value = value;
}

-(void)valueChanged:(NSTimer *)timer
{
    value +=1;
    _progressView.value = value;
    _cricularProgressView.value = value;
    self.triangelProgressView.value = value;
    self.squareProgressView.value = value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
