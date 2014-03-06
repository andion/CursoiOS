//
//  LAMLecture.h
//  lectures_management
//
//  Created by Lucas Andión Montáns on 06/03/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAMLecture : NSObject

- (id) initWithDic:(NSDictionary *)dic;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *startsAt;
@property (nonatomic, strong) NSString *endsAt;

@end
