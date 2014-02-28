//
//  LAMStundentDetailViewController.h
//  lectures_management
//
//  Created by Lucas Andión Montáns on 28/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>
// Class nos permite usar el objeto sin importarlo. Lo importamos en el m
@class LAMStundent;

@interface LAMStundentDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

- (void)loadData:(LAMStundent *)aStundent;

@end
