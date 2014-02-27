//
//  LAMDetailViewController.h
//  masterDetail
//
//  Created by Lucas Andión Montáns on 21/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LAMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
