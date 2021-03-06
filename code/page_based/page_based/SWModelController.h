//
//  SWModelController.h
//  page_based
//
//  Created by Pablo Formoso Estada on 21/02/14.
//  Copyright (c) 2014 Pablo Formoso Estada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDataViewController;

@interface SWModelController : NSObject <UIPageViewControllerDataSource>

- (SWDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(SWDataViewController *)viewController;

@end
