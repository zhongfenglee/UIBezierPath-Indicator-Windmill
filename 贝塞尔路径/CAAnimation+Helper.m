//
//  CAAnimation+Helper.m
//  Weather
//
//  Created by zhongfeng1 on 2017/4/8.
//  Copyright © 2017年 zhongfeng. All rights reserved.
//

/**
 *  1:CABasicAnimation:主要用于缩放，平移，
      转场CATransiton动画主要用于场景切换，
      CAKeyFrameAnimation：关键帧动画，主要用于图标抖动等
    
    2：在CABasicAnimation中，设置anim.removedOnCompletion，目的是动画结束后不删除动画，
       anim.fillMode = kCAFillModeForwards;设置动画的模式，
       设置这两个属性，可以不让动画执行结束后，恢复到原来的位置，而是保留结束动画的状态
    
    3：CAAnimationGroup：她会自动执行数组animations里的动画
 
 */

#import "CAAnimation+Helper.h"

@implementation CAAnimation (Helper)

#pragma mark === 闪烁 ======
+(CABasicAnimation *)opacityWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];//必须写opacity才行。
    
    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);//这是透明度。
    animation.autoreverses = autoreverses;
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.removedOnCompletion = removedOnCompletion;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];// 没有的话是均匀的动画。
    
    return animation;
}

#pragma mark =====横向、纵向移动===========
+(CABasicAnimation *)horizontalMoveFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];///.y的话就向下移动。
    
    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);
    animation.duration = duration;
    animation.autoreverses = autoreverses;
    animation.removedOnCompletion = removedOnCompletion;//yes的话，又返回原位置了。
    animation.repeatCount = repeatCount;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)verticalMoveFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];///.y的话就向下移动。

    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);
    animation.duration = duration;
    animation.autoreverses = autoreverses;
    animation.removedOnCompletion = removedOnCompletion;//yes的话，又返回原位置了。
    animation.repeatCount = repeatCount;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

#pragma mark =====缩放-=============
+(CABasicAnimation *)scaleFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = @(fromValue);
    animation.toValue = @(toValue);
    animation.autoreverses = autoreverses;
    animation.repeatCount = repeatCount;
    animation.duration = duration;//不设置时候的话，有一个默认的缩放时间.
    animation.removedOnCompletion = removedOnCompletion;
    animation.fillMode = kCAFillModeForwards;
    
    return  animation;
}

#pragma mark =====组合动画-=============
+(CAAnimationGroup *)groupAnimationWithAnimationsArray:(NSArray *)animationsArray duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    
    animation.animations = animationsArray;
    animation.duration = duration;
    animation.removedOnCompletion = removedOnCompletion;
    animation.autoreverses = autoreverses;
    animation.repeatCount = repeatCount;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+(CAKeyframeAnimation *)keyframeAnimationWithValues:(NSArray *)values duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    animation.values = values;
    animation.duration = duration;
    animation.removedOnCompletion = removedOnCompletion;
    animation.autoreverses = autoreverses;
    animation.repeatCount = repeatCount;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}




#pragma mark =====路径动画-=============
+(CAKeyframeAnimation *)keyframeAnimationWithPath:(CGMutablePathRef)path duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path = path;
    animation.removedOnCompletion = removedOnCompletion;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.autoreverses = autoreverses;
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    
    
    return animation;
}

#pragma mark ====旋转动画======
+(CABasicAnimation *)rotateToValue:(NSNumber *)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(float)repeatCount {
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    rotationAnimation.toValue = toValue;
    rotationAnimation.repeatCount = repeatCount;
    rotationAnimation.duration = duration;
    rotationAnimation.removedOnCompletion = removedOnCompletion;
    rotationAnimation.autoreverses = autoreverses;
    rotationAnimation.fillMode = kCAFillModeForwards;
    
    return rotationAnimation;
}

//-(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
//{
//    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
//    animation.duration  =  dur;
//    animation.autoreverses = NO;
//    animation.cumulative = NO;
//    animation.fillMode = kCAFillModeForwards;
//    animation.repeatCount = repeatCount;
////    animation.delegate = self;
//    
//    return animation;
//
//}

@end
