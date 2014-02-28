//
//  LAMStundentCell.h
//  lectures_management
//
//  Created by Lucas Andión Montáns on 27/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LAMStundentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
