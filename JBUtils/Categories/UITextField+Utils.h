//
//  UITextField+Utils.h
//  JBUtils
//
//  Created by Jonathan BOUAZIZ on 18/02/2014.
//  Copyright (c) 2014 jbouaziz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Utils)


/**
 *  The currently selected range.
 *
 *  @return SelectedRange
 */
- (NSRange)selectedRange;


/**
 *  Set the newly selected range using NSRange. e.g.: NSMakeRange(2, 5)
 *
 *  @param range New selected range
 */
- (void)setSelectedRange:(NSRange)range;

@end
