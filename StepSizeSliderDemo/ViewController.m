//
//  ViewController.m
//  StepSizeSliderDemo
//
//  Created by cchhjj on 16/11/28.
//  Copyright © 2016年 CanHe Chen. All rights reserved.
//

#import "ViewController.h"
#import "SCStepSlider.h"

#import "SCThumb.h"

#define THUMB_WIDTH 25

@interface ViewController (){
    
    SCStepSlider *slider2;
}

@property (nonatomic, strong) SCThumb *circleV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGFloat w = self.view.frame.size.width - 60;
    
    slider2 = [[SCStepSlider alloc] initWithFrame:CGRectMake(30, 130, w, 50)];
    slider2.titleArray = @[@"1",@"10"];
    slider2.lineWidth = 8;
    slider2.titleOffset = 15;
    slider2.index = 0;
    slider2.stepWidth = 5;
    slider2.stepColor = [UIColor redColor];
    slider2.sliderOffset = -8;
    slider2.stepTouchRate = 2;
    slider2.thumbSize = CGSizeMake(THUMB_WIDTH, THUMB_WIDTH);
    slider2.thumbTouchRate = 2;
    slider2.numberOfStep = 10;
    slider2.continuous = NO;
    [slider2 addTarget:self action:@selector(valueChangeAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider2];
    
    
    self.circleV = [SCThumb thumbWithFrame:CGRectMake(0, 0, THUMB_WIDTH, THUMB_WIDTH)];
    [self.circleV setProcess:(1/(float)10) centerText:@"1"];
    
    slider2.thumbImage = [self makeImageWithView:self.circleV withSize:CGSizeMake(THUMB_WIDTH, THUMB_WIDTH)];

//    [self.view addSubview:self.circleV];
    
}


- (void)valueChangeAction:(SCStepSlider *)sender {
    NSLog(@"sender :%@,value :%f,index :%ld",sender,sender.value,(long)sender.index);
    
    
    CGFloat process = (sender.index + 1)/(float)
    10;
    NSString *centerText = [NSString stringWithFormat:@"%ld", sender.index + 1];
    [self.circleV setProcess:process centerText:centerText];
//    self.circleV.circleView.ovalShapeLayer.strokeEnd = (sender.index + 1)/(float)5;
     UIImage *img = [self makeImageWithView:self.circleV withSize:CGSizeMake(THUMB_WIDTH, THUMB_WIDTH)];
    slider2.thumbImage = img;
    

}

- (UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size
{
    
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
