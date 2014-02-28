//
//  LAMStundent.h
//  lectures_management
//
//  Created by Lucas Andión Montáns on 27/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAMStundent : NSObject
- (id)initWithName:(NSString *)aName
           surname:(NSString *)aSurname
           andMail:(NSString *)anEmail;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *avatarUrl;

-(NSString *)fullName;

@end
