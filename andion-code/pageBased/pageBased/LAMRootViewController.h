//
//  LAMRootViewController.h
//  pageBased
//
//  Created by Lucas Andión Montáns on 21/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

// GESTIONA LAS ACCIONES, y el datasource nos devuelve en el callback que tiene
// que representar.

#import <UIKit/UIKit.h>

@interface LAMRootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
