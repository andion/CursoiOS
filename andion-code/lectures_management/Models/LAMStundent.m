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

#pragma mark - KeyedArchive (Capa de almacenamiento)
// Cualquier objeto tiene estos dos métodos, en NSObject está implementado como un "protocolo"

- (id)initWithCoder:(NSCoder *)coder {

  self = [[ LAMStundent alloc] init]; //No podemos invocar [super init] porque NO esta implem.
  
  _name     = [coder decodeObjectForKey:@"name"];
  _surname  = [coder decodeObjectForKey:@"surname"];
  _city     = [coder decodeObjectForKey:@"city"];
  _email    = [coder decodeObjectForKey:@"email"];
  _avatarUrl= [coder decodeObjectForKey:@"avatar"];
  
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [coder encodeObject:_name forKey:@"name"];
  [coder encodeObject:_surname forKey:@"surname"];
  [coder encodeObject:_email forKey:@"email"];
  [coder encodeObject:_city forKey:@"city"];
  [coder encodeObject:_avatarUrl forKey:@"avatar"];
}

@end
