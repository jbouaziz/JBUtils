//
//  UICollectionView+ReloadItemsAnimated.h
//  My16
//
//  Created by Jonathan BOUAZIZ on 30/01/2014.
//  Copyright (c) 2014 My16. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (ReloadItemsAnimated)


/**
 *  Reload items at index path. Choose whether to animate or not.
 *
 *  @param indexPaths indexPaths of items to reload
 *  @param animated   animated flag (default UICollectionView behavior to YES)
 */
- (void)reloadItemsAtIndexPaths:(NSArray *)indexPaths animated:(BOOL)animated;

@end
