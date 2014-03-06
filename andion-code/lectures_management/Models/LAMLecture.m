//
//  LAMLecture.m
//  lectures_management
//

#import "LAMLecture.h"

@implementation LAMLecture

- (id)initWithDic:(NSDictionary *)dic{
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  self = [super init];
  
  if (self){
    _name = [dic objectForKey:@"name"];
    _description = [dic objectForKey:@"description"];
    _startsAt = [dic objectForKey:@"starts_at"];
    _endsAt = [dic objectForKey:@"ends_at"];
  }
  
  return self;
}

@end
