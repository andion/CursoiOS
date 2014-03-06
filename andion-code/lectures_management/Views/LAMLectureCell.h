//
//  LAMLectureCell.h
//  lectures_management
//
//  Created by Lucas Andión Montáns on 06/03/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LAMLectureCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *startsAtLabel;
@property (nonatomic, weak) IBOutlet UILabel *endsAtLabel;

@end
