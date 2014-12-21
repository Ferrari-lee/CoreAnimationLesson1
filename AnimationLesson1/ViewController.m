//
//  ViewController.m
//  AnimationLesson1
//
//  Created by 臧其龙 on 14/12/14.
//  Copyright (c) 2014年 臧其龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *view1;
}
@property (weak, nonatomic) IBOutlet UISlider *xySlider;
@property (weak, nonatomic) IBOutlet UISlider *ySlider;
@property (weak, nonatomic) IBOutlet UISlider *groupSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _xySlider.alpha = 0;
    _ySlider.alpha = 0;
    _groupSlider.alpha = 0;
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view1.center = self.view.center;
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    view1.layer.cornerRadius = 15;
    view1.layer.masksToBounds = YES;
    //view1.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeScaleAnimation:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    view1.layer.timeOffset = slider.value;
}

- (IBAction)changeStartScaleYAnimation:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    view1.layer.timeOffset = slider.value;
}

- (IBAction)changeGroupAnimation:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    view1.layer.timeOffset = slider.value;
}

- (IBAction)startScaleXYAnimation:(id)sender
{
    _groupSlider.alpha=0;
    _xySlider.alpha = 1;
    _ySlider.alpha = 0;
    [view1.layer removeAllAnimations];
    [view1.layer addAnimation:[self createScaleAnimation] forKey:@"scaleAnimation"];
    view1.layer.speed = 0;
    view1.layer.timeOffset = 0;
}

- (IBAction)startScaleYAnimation:(id)sender
{
    _groupSlider.alpha=0;
    _xySlider.alpha = 0;
    _ySlider.alpha = 1;
    [view1.layer removeAllAnimations];
    [view1.layer addAnimation:[self createScaleYAnimation] forKey:@"scaleYAnimation"];
    view1.layer.speed = 0;
    view1.layer.timeOffset = 0;
}

- (IBAction)startgroupAnimation:(id)sender
{
    _xySlider.alpha = 0;
    _ySlider.alpha = 0;
    _groupSlider.alpha=1;
    [view1.layer removeAllAnimations];
    [view1.layer addAnimation:[self createGroupAnimation] forKey:@"groupAnimation"];
    view1.layer.speed = 0;
    view1.layer.timeOffset = 0;
}

- (CABasicAnimation *)createScaleAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 3.;
    animation.fromValue = @(0.1);
    animation.toValue = @(1.);
    return animation;
}

- (CABasicAnimation *)createScaleYAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.duration = 3.;
    animation.fromValue = @(1);
    animation.toValue = @(2.);
    return animation;
}

- (CAAnimationGroup *)createGroupAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 3.;
    animation.fromValue = @(0.1);
    animation.toValue = @(1.);
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation2.duration = 3.;
    animation2.fromValue = @(1);
    animation2.toValue = @(2.);
    animation2.beginTime = 3.;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 6.;
    group.animations = @[animation,animation2];
    return group;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
