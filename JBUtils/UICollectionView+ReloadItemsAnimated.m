//
//  UICollectionView+ReloadItemsAnimated.m
//  My16
//
//  Created by Jonathan BOUAZIZ on 30/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import "UICollectionView+ReloadItemsAnimated.h"

@implementation UICollectionView (ReloadItemsAnimated)

- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated {
    if (!animated) {
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    }
    
    [self reloadItemsAtIndexPaths:indexPaths];
    
    if (!animated)
        [CATransaction commit];
}

@end
