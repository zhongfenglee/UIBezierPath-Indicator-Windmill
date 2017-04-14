//
//  DialView.m
//  贝塞尔路径
//
//  Created by zhongfeng1 on 2017/4/1.
//  Copyright © 2017年 zhongfeng. All rights reserved.
//

#import "DialView.h"
#import "CAAnimation+Helper.h"

#define RGBColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface DialView ()

@property (nonatomic,strong) CAShapeLayer *indicatorShapeLayer;


@end

@implementation DialView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    CGFloat selfCenterX = width * 0.5;
    CGFloat selfCenterY = height * 0.5;

    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor yellowColor];
        
        // 圆环
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
        shapeLayer.position = CGPointMake(selfCenterX, selfCenterY);
        shapeLayer.lineWidth = 10;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.path = [self drawCirclePath].CGPath;
        [self.layer addSublayer:shapeLayer];
        
        // 渐变色
        CALayer *gradinetLayer = [CALayer layer];
        
        CAGradientLayer *gradient1 = [CAGradientLayer layer];
        
        gradient1.frame = CGRectMake(0, 0, self.frame.size.width/2, self.frame.size.height);
        gradient1.colors = @[(id)RGBColor(119, 193, 80, 1).CGColor, (id)RGBColor(240, 186, 67, 1).CGColor, (id)RGBColor(253, 156, 88, 1).CGColor];
        //        gradient1.locations = @[@0.5,@0.9,@1];
        gradient1.startPoint = CGPointMake(0, 0.5);
        gradient1.endPoint = CGPointMake(1,0.5);
        [gradinetLayer addSublayer:gradient1];
        
        
        CAGradientLayer *gradient2 = [CAGradientLayer layer];
        gradient2.frame =  CGRectMake(self. frame. size. width/ 2, 0, self.frame.size. width/ 2, self.frame.size.height);
        gradient2.colors = @[(id)RGBColor(253, 156, 88, 1).CGColor, (id)RGBColor(240, 118, 79, 1).CGColor, (id)RGBColor(169, 64, 87, 1).CGColor];
        //        gradient1.locations = @[@1,@1,@1];
        gradient2.startPoint = CGPointMake(0, 0.5);
        gradient2.endPoint = CGPointMake(1,0.5);
        [gradinetLayer addSublayer:gradient2];
        
        gradinetLayer.mask = shapeLayer;
        [self.layer addSublayer:gradinetLayer];
        
        // 指针
        CAShapeLayer *indicatorShapeLayer = [CAShapeLayer layer];
        indicatorShapeLayer.anchorPoint = CGPointMake(1, 0.5);
        indicatorShapeLayer.position = CGPointMake(selfCenterX, selfCenterY);
        indicatorShapeLayer.fillColor = [UIColor redColor].CGColor;
        indicatorShapeLayer.path = [self drawIndicatorPath].CGPath;
        indicatorShapeLayer.transform = CATransform3DMakeRotation(M_PI,0,0,1);
        self.indicatorShapeLayer = indicatorShapeLayer;
        [self.layer addSublayer:indicatorShapeLayer];
    }
    
    return self;
}

#pragma mark - 贝塞尔路径画圆
-(UIBezierPath *)drawCirclePath {
    CGFloat radius = self.frame.size.width * 0.5 - 5;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, 0) radius:radius startAngle:0 endAngle:M_PI clockwise:0];
    return path;
}

#pragma mark - 贝塞尔路径画指针
-(UIBezierPath *)drawIndicatorPath {
    CGFloat startX = 0;
    CGFloat startY = 0;
    
    CGFloat width = self.frame.size.width * 0.5;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(startX, startY)];
    [path addLineToPoint:CGPointMake(startX + 5, startY - 3)];
    [path addLineToPoint:CGPointMake(startX + width, startY)];
    [path addLineToPoint:CGPointMake(startX + 5, startY + 3)];
    
    [path closePath];
    
    return path;
}

#pragma mark - 指针指向一定的角度
-(void)setPercent:(CGFloat)percent {
    _percent = percent;
    
    [UIView animateWithDuration:3 delay:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CABasicAnimation *rotationAnimation = [CABasicAnimation rotateToValue:@(M_PI + (percent <= 500? percent: 500) / 500.0 * M_PI) duration:2 autoreverses:YES removedOnCompletion:NO repeatCount:0.5];
        [self.indicatorShapeLayer addAnimation:rotationAnimation forKey:@"dialView-rotateAnimation"];
    } completion:nil];
}

@end
