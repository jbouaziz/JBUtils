//
//  UIView+Utils.m
//  My16
//
//  Created by Jonathan BOUAZIZ on 20/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)


#pragma mark - Delays functions

+ (void)runBlock:(void (^)())block {
    block();
}

+ (void)runAfterDelay:(CGFloat)delay block:(void (^)())block {
    void (^block_)() = [block copy];
    [self performSelector:@selector(runBlock:) withObject:block_ afterDelay:delay];
}


#pragma mark - Motion Group

+ (void)addCenterMotionEffectToView:(UIView *)view value:(CGFloat)value {
    [self addCenterMotionEffectToView:view
                xMinimumRelativeValue:-(value)
                xMaximumRelativeValue:value
                yMinimumRelativeValue:-(value)
                yMaximumRelativeValue:value];
}

+ (void)addCenterMotionEffectToView:(UIView *)view
              xMinimumRelativeValue:(CGFloat)xMinValue
              xMaximumRelativeValue:(CGFloat)xMaxValue
              yMinimumRelativeValue:(CGFloat)yMinValue
              yMaximumRelativeValue:(CGFloat)yMaxValue {
    
    if (!view || ![view respondsToSelector:@selector(addMotionEffect:)]) return;
    
    
    // Set vertical effect
    //
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                    type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(yMinValue);
    verticalMotionEffect.maximumRelativeValue = @(yMaxValue);
    
    
    // Set horizontal effect
    //
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                    type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(xMinValue);
    horizontalMotionEffect.maximumRelativeValue = @(xMaxValue);
    
    
    // Create group to combine both
    //
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    
    // Add both effects to the view
    //
    [view addMotionEffect:group];
}

@end
