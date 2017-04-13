//
//  WindmillView.m
//  贝塞尔路径
//
//  Created by zhongfeng1 on 2017/3/30.
//  Copyright © 2017年 zhongfeng. All rights reserved.
//

#import "WindmillView.h"
#import "CAAnimation+Helper.h"

@interface WindmillView ()

// 扇面view
@property (nonatomic,strong) UIView *fanView;

@end

@implementation WindmillView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    // 在这里获得的frame:{0,0,150,150}，center:{0,0}，即只是WindmillView自身绝对frame，在父view中的frame(即你设置的frame)还没有传进来
//    CGFloat width = frame.size.width;
//    CGFloat height = frame.size.height;
//    CGFloat selfCenterX = width * 0.5;
//    CGFloat selfCenterY = height * 0.5;
    
    if (self = [super initWithFrame:frame]) {
        // 由于执行了self = [super initWithFrame:frame]，因此父view的frame传进来了，这里获得frame就是在父view中的frame(即你设置的frame) {100,100,150,150} center:{100 + 150 * 0.5, 100 + 150 * 0.5}
        
        CGColorRef wantedColor = [UIColor whiteColor].CGColor;
        
        /*放三个扇叶的扇面view*/
        self.fanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        
        /* 三个扇叶 */
        for (int i = 1; i <= 3; i ++) {
            CAShapeLayer *bladeShapeLayer = [CAShapeLayer layer];
            bladeShapeLayer.fillColor = wantedColor;
            bladeShapeLayer.anchorPoint = CGPointMake(0, 0);
            bladeShapeLayer.position = self.fanView.center;
            bladeShapeLayer.transform = CATransform3DMakeRotation(M_PI/6 *(4 * i - 3),0,0,1);
            bladeShapeLayer.path = [self bladePath].CGPath;
            
            [self.fanView.layer addSublayer:bladeShapeLayer];
        }
        
        [self addSubview:self.fanView];
        
        /* 扇面中间的原点 */
        CAShapeLayer *middlePointShapeLayer = [CAShapeLayer layer];
        middlePointShapeLayer.fillColor = wantedColor;
        middlePointShapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
        middlePointShapeLayer.position = self.fanView.center;
        // 贝塞尔路径画圆
        middlePointShapeLayer.path = [self middlePointPath].CGPath;
        [self.layer addSublayer:middlePointShapeLayer];
        
        /* 支柱 */
         CAShapeLayer *pillarShapeLayer = [CAShapeLayer layer];
         pillarShapeLayer.fillColor = wantedColor;
         pillarShapeLayer.anchorPoint = CGPointMake(0.5, 0.5);
         pillarShapeLayer.position = self.fanView.center;
         pillarShapeLayer.path = [self pillarPath].CGPath;
         [self.layer addSublayer:pillarShapeLayer];
    }
    
    return self;
}

#pragma mark - 贝塞尔路径画扇叶
-(UIBezierPath *)bladePath {
    // 注意：贝塞尔路径画线时，不要关心起始点坐标，设为{0,0}即可，只要其他拐点参考该起始点坐标进行设置即可，最终决定画出的贝塞尔路径展示在哪里，是由CAShapeLayer的position决定的
    CGFloat startX = 0;
    CGFloat startY = 0;
    
    CGFloat endX = self.frame.size.width * 0.5;
    
    // 贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 起始点
    [path moveToPoint:CGPointMake(startX, startY)];
    // 终点、拐点1、拐点2
    [path addCurveToPoint:CGPointMake(endX, startY) controlPoint1:CGPointMake(endX - 20, startY - 5) controlPoint2:CGPointMake(endX - 5,startY - 3)];
    // 拐点1、终点
    [path addQuadCurveToPoint:CGPointMake(startX + 15, startY + 5) controlPoint:CGPointMake(endX, startY)];
    
    // 闭合路径
    [path closePath];
    
    return path;
}


#pragma mark - 贝塞尔路径画圆点
-(UIBezierPath *)middlePointPath {
    // 注意：贝塞尔路径画线时，不要关心起始点坐标，设为{0,0}即可，只要其他拐点参考该起始点坐标进行设置即可，最终决定画出的贝塞尔路径展示在哪里，是由CAShapeLayer的position决定的
    CGFloat startX = 0;
    CGFloat startY = 0;

    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(startX, startY) radius:3 startAngle:0 endAngle:2 * M_PI clockwise:1];
}

#pragma mark - 贝塞尔路径画支柱
-(UIBezierPath *)pillarPath {
    CGFloat centerX = 0;
    CGFloat centerY = 0;
    
//    CGFloat maxX = self.frame.size.width * 0.5;
    CGFloat maxY = self.frame.size.height * 0.8;
    
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(centerX - 2, centerY + 4)];
    [path addLineToPoint:CGPointMake(centerX + 2, centerY + 4)];
    [path addLineToPoint:CGPointMake(centerX + 4, maxY)];
    [path addQuadCurveToPoint:CGPointMake(centerX - 4, maxY) controlPoint:CGPointMake(centerX, maxY + 5)];
    
    [path closePath];
    
    return path;
}

#pragma mark - 根据duration来决定转速
-(void)setDuration:(CGFloat)duration {
    _duration = duration;
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation rotateToValue:@(2 * M_PI) duration:duration autoreverses:NO removedOnCompletion:NO repeatCount:MAXFLOAT];
    [self.fanView.layer addAnimation:rotationAnimation forKey:@"WindmillView-rotateAnimation"];
}

@end
