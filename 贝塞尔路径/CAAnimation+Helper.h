//
//  CAAnimation+Helper.h
//  Weather
//
//  Created by zhongfeng1 on 2017/4/8.
//  Copyright © 2017年 zhongfeng. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (Helper)

+(CABasicAnimation *)opacityWithFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CABasicAnimation *)horizontalMoveFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CABasicAnimation *)verticalMoveFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CABasicAnimation *)scaleFromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;


+(CAAnimationGroup *)groupAnimationWithAnimationsArray:(NSArray *)animationsArray duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CAKeyframeAnimation *)keyframeAnimationWithValues:(NSArray *)values duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CAKeyframeAnimation *)keyframeAnimationWithPath:(CGMutablePathRef)path duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(CGFloat)repeatCount;

+(CABasicAnimation *)rotateToValue:(NSNumber *)toValue duration:(CGFloat)duration autoreverses:(BOOL)autoreverses removedOnCompletion:(BOOL)removedOnCompletion repeatCount:(float)repeatCount;

@end
