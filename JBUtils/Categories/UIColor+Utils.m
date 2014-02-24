//
//  UIColor+Utils.m
//  My16
//
//  Created by Jonathan BOUAZIZ on 06/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//
// http://www.cocoanetics.com/2009/10/manipulating-uicolors/
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)

- (UIColor *)lighterColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.3, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColor {
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.75
                               alpha:a];
    return nil;
}

@end
