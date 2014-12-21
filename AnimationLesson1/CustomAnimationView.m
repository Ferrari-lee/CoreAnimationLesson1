//
//  CustomAnimationView.m
//  AnimationLesson1
//
//  Created by 臧其龙 on 14/12/21.
//  Copyright (c) 2014年 臧其龙. All rights reserved.
//

#import "CustomAnimationView.h"

@interface CustomAnimationView ()
{
    UIView *animationView;
}
@end

@implementation CustomAnimationView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        
        animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        animationView.center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)-10);
        animationView.backgroundColor = [UIColor redColor];
        [self addSubview:animationView];
        
        animationView.layer.cornerRadius = 20;
        animationView.layer.masksToBounds = YES;
        
        [animationView.layer addAnimation:[self createGroupAnimation] forKey:@"group"];
        animationView.layer.speed = 0;
        animationView.layer.timeOffset = 0;
    }
    return self;
}

- (void)setAnimationProgress:(CGFloat)time
{
    animationView.layer.timeOffset = time;
}

- (CAAnimationGroup *)createGroupAnimation
{
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"position"];
    animationPosition.duration = 8;
    
    animationPosition.toValue = [NSValue valueWithCGPoint:CGPointMake(animationView.layer.position.x, animationView.layer.position.y-50)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 3.;
    animation.fromValue = @(0.1);
    animation.toValue = @(1.);
    
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation2.duration = 5.;
    animation2.fromValue = @(1.);
    animation2.toValue = @(3.);
    animation2.beginTime = 3.;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 8.;
    group.animations = @[animationPosition,animation,animation2];
    return group;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
