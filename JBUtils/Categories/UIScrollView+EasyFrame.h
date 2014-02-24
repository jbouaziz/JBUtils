//
//  UIScrollView+EasyFrame.h
//  My16
//
//  Created by Jonathan BOUAZIZ on 31/12/2013.
//  Copyright (c) 2013 My16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (EasyFrame)

// Content Offset
@property (nonatomic) CGFloat contentOffsetX;
@property (nonatomic) CGFloat contentOffsetY;

// Content Size
@property (nonatomic) CGFloat contentSizeWidth;
@property (nonatomic) CGFloat contentSizeHeight;

// Content Inset
@property (nonatomic) CGFloat contentInsetTop;
@property (nonatomic) CGFloat contentInsetLeft;
@property (nonatomic) CGFloat contentInsetBottom;
@property (nonatomic) CGFloat contentInsetRight;

@end
