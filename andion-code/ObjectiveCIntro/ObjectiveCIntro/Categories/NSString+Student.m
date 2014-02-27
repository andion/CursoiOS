//
//  NSString+Student.m
//  ObjectiveCIntro
//

#import "NSString+Student.h"

// Aquí sí hacemos el import (ver .h)
#import "Student.h"

@implementation NSString (Student)

// Le concatenamos a lo que sea el nombre del alumno
- (NSString *)greetStudent:(Student *)student{
  // self aquí es el objeto NSString
  return [self stringByAppendingString:[student fullName]];
}

@end
