//
//  SQLiteAccess+Lecture.h
//  lectures_management
//

@class LAMStundent;
#import "SQLiteAccess.h"

@interface SQLiteAccess (Lecture)

+ (NSString *)getName;
+ (LAMStundent *)getStundent:(NSString *)email;
+ (NSArray *)getAllStundents;

@end
