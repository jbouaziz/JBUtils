//
//  UIButton+Utils.m
//  My16
//
//  Created by Jonathan BOUAZIZ on 01/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import "UIButton+Utils.h"

@implementation UIButton (Utils)


- (void)setFont:(UIFont *)font textColor:(UIColor *)color {
    [self setFont:font textColor:color forState:UIControlStateNormal];
}

- (void)setFont:(UIFont *)font textColor:(UIColor *)color forState:(UIControlState)state {
    
    self.titleLabel.font = font;
    [self setTitleColor:color forState:state];
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title animated:NO];
}

- (void)setTitle:(NSString *)title animated:(BOOL)animated {
    if (!animated)
        [UIView setAnimationsEnabled:NO];
    
    [self setTitle:title forState:UIControlStateNormal];
    
    if (!animated)
        [UIView setAnimationsEnabled:YES];
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle {
    [self setAttributedTitle:attributedTitle animated:NO];
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle animated:(BOOL)animated {
    if (!animated)
        [UIView setAnimationsEnabled:NO];
    
    [self setAttributedTitle:attributedTitle forState:UIControlStateNormal];
    
    if (!animated)
        [UIView setAnimationsEnabled:YES];
}


@end
