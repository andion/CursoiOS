//
//  Student.h
//  ObjectiveCIntro
//

#import <Foundation/Foundation.h>

// You must extend from one Object at least. And we implement Attendance Protocol
@interface Student : NSObject <AttendanceDelegate>

- (id)initWithFirstName: (NSString *)aFirstName andFamilyName:(NSString *)aFamilyName;

@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *family_name;

- (NSString *)fullName;
- (void)useBlock:(void (^)(void))codeBlock;

@end
