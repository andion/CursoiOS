//
//  LAMModelController.h
//  pageBased
//
//  Created by Lucas Andión Montáns on 21/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LAMDataViewController;

@interface LAMModelController : NSObject <UIPageViewControllerDataSource>

- (LAMDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(LAMDataViewController *)viewController;

@end
