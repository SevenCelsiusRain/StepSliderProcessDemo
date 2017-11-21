//
//  SCThumb.h
//  StepSizeSliderDemo
//
//  Created by SevenCelsius on 2017/11/21.
//  Copyright © 2017年 CanHe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCCircleProcess;
@interface SCThumb : UIView

@property (strong, nonatomic) UILabel *centerLab;

@property (strong, nonatomic) SCCircleProcess *circleView;

+ (instancetype)thumbWithFrame:(CGRect)frame;

- (void)setProcess:(CGFloat)process centerText:(NSString *)centerText;

@end
