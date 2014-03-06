//
//  SQLiteAccess+Lecture.m
//  lectures_management
//

#import "LAMStundent.h"
#import "SQLiteAccess+Lecture.h"

@implementation SQLiteAccess (Lecture)

+ (NSString *)getName {
  
  NSString *query = @"SELECT nombre FROM alumnos WHERE email = 'pablo@pabloformoso.com'";

  return [SQLiteAccess selectOneValueSQL:query];
}

+ (LAMStundent *)getStundent:(NSString *)email {
  
  NSString *query = [@"SELECT * FROM alumnos WHERE email = " stringByAppendingFormat:@"'%@'", email];
  
  NSDictionary *dic = [SQLiteAccess selectOneRowWithSQL:query];
  
  return [[LAMStundent alloc] initWithDictionary:dic];
}

+ (NSArray *)getAllStundents {
  
  NSString *query = @"SELECT * FROM alumnos";
  
  NSArray *tmpArray = [SQLiteAccess selectManyRowsWithSQL:query];
  NSMutableArray *returnArray = [[NSMutableArray alloc] init] ;
  
  for(NSDictionary *dic in tmpArray) {
    LAMStundent *student = [[LAMStundent alloc] initWithDictionary:dic];
    [returnArray addObject:student];
  }
  return returnArray;
}

@end
