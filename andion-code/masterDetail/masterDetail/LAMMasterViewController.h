//
//  LAMMasterViewController.h
//  masterDetail
//
//  Created by Lucas Andión Montáns on 21/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LAMDetailViewController;

@interface LAMMasterViewController : UITableViewController

@property (strong, nonatomic) LAMDetailViewController *detailViewController;

@end
