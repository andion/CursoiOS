//
//  Student.m
//  ObjectiveCIntro
//
//  Created by Lucas Andión Montáns on 20/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import "Student.h"

@implementation Student


// Constructor.
// Set parameters, call super and must return the Object (Student)

- (id)initWithFirstName: (NSString *)aFirstName andFamilyName:(NSString *)aFamilyName {
  
  self = [super init];

  if (self) {
    _first_name   = aFirstName;
    _family_name  = aFamilyName;
  }

  return self;
}

- (NSString *)fullName {
  return [_first_name stringByAppendingFormat:@" %@", _family_name];
}

// El pragma mark nos divide estos métodos en otro grupo. Útil para la vista de ficheros superior
// y la navegación.
#pragma mark - Attendance Protocol Implementation

- (BOOL)confirmAttendance {
  return YES;
}

- (BOOL)cancelAttendance {
  return NO;
}

- (void)attendanceStatus {
  NSLog(@"Attendance Status!");
}

// Usamos otro pragma mark
// Con la parte de debugging creamos un snippet para loguear sólo en debug. Arrastramos las líneas
// de código a la parte inferior derecha, le damos un nombre y listos
#pragma mark - Using Blocks

- (void)useBlock:(void (^)(void))codeBlock {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  codeBlock();
}

@end
