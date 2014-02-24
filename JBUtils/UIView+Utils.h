//
//  UIView+Utils.h
//  My16
//
//  Created by Jonathan BOUAZIZ on 20/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

/**
 *  Run a block.
 *
 *  @param block block to run
 */
+ (void)runBlock:(void (^)())block;


/**
 *  Run block after delay.
 *
 *  @param delay Delay in seconds
 *  @param block Block to execute
 */
+ (void)runAfterDelay:(CGFloat)delay block:(void (^)())block;


/**
 *  Add the iOS7 Motion Effect feature on the horizontal and vertical axis.
 *
 *  @param view  view to apply the effect on
 *  @param value single value that will be used to both axis
 */
+ (void)addCenterMotionEffectToView:(UIView *)view value:(CGFloat)value;


/**
 *  Add the iOS7 Motion Effect feature on the horizontal and vertical axis.
 *
 *  @param view      view to apply the effect on
 *  @param xMinValue X minimum value
 *  @param xMaxValue X maximum value
 *  @param yMinValue Y minimum value
 *  @param yMaxValue Y maximum value
 */
+ (void)addCenterMotionEffectToView:(UIView *)view
              xMinimumRelativeValue:(CGFloat)xMinValue
              xMaximumRelativeValue:(CGFloat)xMaxValue
              yMinimumRelativeValue:(CGFloat)yMinValue
              yMaximumRelativeValue:(CGFloat)yMaxValue;

@end
