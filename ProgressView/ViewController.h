//
//  ViewController.h
//  ProgressView
//
//  Created by lifangli on 15/7/9.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "progressView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet progressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *cricularImg;
@property (weak, nonatomic) IBOutlet UIImageView *triangelImg;
@property (weak, nonatomic) IBOutlet UIImageView *squareImg;
@property (weak, nonatomic) IBOutlet progressView *cricularProgressView;
@property (weak, nonatomic) IBOutlet progressView *triangelProgressView;
@property (weak, nonatomic) IBOutlet progressView *squareProgressView;

@end

