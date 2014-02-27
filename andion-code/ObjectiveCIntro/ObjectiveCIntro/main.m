//
//  main.m
//  ObjectiveCIntro
//

#import <Foundation/Foundation.h>
#import "Student.h"
// Importamos nuestra categoria y a partir de aquí cualquier string queda extendido con nuestra categoría
// y puede usar ese método
#import "NSString+Student.h"

int main(int argc, const char * argv[])
{

  @autoreleasepool {
    Student *andion = [[Student alloc] initWithFirstName:@"Lucas" andFamilyName:@"Andión"];
    NSLog(@"Student's name: %@", andion.fullName);
    
    if ([andion confirmAttendance]){
      //NSLog([@"Student confirming asistance: " greetStudent:andion]);
      NSLog(@"LOL");
    }
    
    // COmprobamos si el Student implementa el método @optional del protocolo Attendance
    // A esto se llama usar un protocolo 'informal'.

    if ([andion respondsToSelector:@selector(attendanceStatus)]) {
      // No sabemos que objeto está implementando el protocolo, así que lo llamamos
      // con performSelector, algo así como duck typing
      // Además podriamos ejecutarla directamente o en background o dentro de X tiempo.
      [andion performSelector:@selector(attendanceStatus)];
    }
    
    [andion useBlock:^{
#ifndef NDEBUG
      NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
      NSLog(@"Executing a code block");
    }];
    
  }
  
  return 0;
}

