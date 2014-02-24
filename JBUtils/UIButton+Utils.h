//
//  UIButton+Utils.h
//  My16
//
//  Created by Jonathan BOUAZIZ on 01/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Utils)

- (void)setFont:(UIFont *)font textColor:(UIColor *)color;
- (void)setFont:(UIFont *)font textColor:(UIColor *)color forState:(UIControlState)state;

- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title animated:(BOOL)animated;

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle;
- (void)setAttributedTitle:(NSAttributedString *)attributedTitle animated:(BOOL)animated;

@end
