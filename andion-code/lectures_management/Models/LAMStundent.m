//
//  LAMStundent.m
//  lectures_management
//
//  Created by Lucas Andión Montáns on 27/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import "LAMStundent.h"

@implementation LAMStundent

- (id)initWithName:(NSString *)aName
           surname:(NSString *)aSurname
           andMail:(NSString *)anEmail{
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  self = [super init];
  if (self){
    _name = aName;
    _surname = aSurname;
    _email = anEmail;
    _city = @"Moraña";
    _avatarUrl = @"";
  }
  return self;
}

-(NSString *)fullName {
  return [_name stringByAppendingFormat:@" %@", _surname];
}

@end
