//
//  SCThumb.m
//  StepSizeSliderDemo
//
//  Created by SevenCelsius on 2017/11/21.
//  Copyright © 2017年 CanHe Chen. All rights reserved.
//

#import "SCThumb.h"
#import "SCCircleProcess.h"

@implementation SCThumb

+ (instancetype)thumbWithFrame:(CGRect)frame {
    
    SCThumb *thumBview = [[SCThumb alloc] initWithFrame:frame];
    [thumBview setupView];
    return thumBview;
}

- (void)setupView {
    
    self.circleView = [[SCCircleProcess alloc] initWithFrame:self.bounds];
    [self addSubview:self.circleView];
    
    self.centerLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 15)];
    self.centerLab.center = self.circleView.center;
    self.centerLab.textAlignment = NSTextAlignmentCenter;
    self.centerLab.font = [UIFont systemFontOfSize:12];
    self.centerLab.textColor = [UIColor whiteColor];
    
    [self addSubview:self.centerLab];
}

- (void)setProcess:(CGFloat)process centerText:(NSString *)centerText {
    
    self.circleView.ovalShapeLayer.strokeEnd = process;
    self.centerLab.text = centerText;
}

@end
