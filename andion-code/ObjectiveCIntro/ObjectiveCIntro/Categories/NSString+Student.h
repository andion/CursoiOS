//
//  NSString+Student.h
//  ObjectiveCIntro
//

// No importamos, mete el código de la clase aquí. Así no mete la cabecera del alumno cada vez.
// Luego en el .m lo importamos, así sólo lo importamos una vez. Simplemente ahorra bytecode.
@class Student;

#import <Foundation/Foundation.h>

@interface NSString (Student)

- (NSString *)greetStudent:(Student *)student;

@end
