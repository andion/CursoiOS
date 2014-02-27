//
//  AttendanceDelegate.h
//  ObjectiveCIntro
//
// Protocolo.
// Es probable que se use en muchas partes dentro de un proyecto. por lo que tiene logica
// meterlo en el .pch para no tener que hacer el import en cada clase en la que lo usemos.


#import <Foundation/Foundation.h>

@protocol AttendanceDelegate <NSObject>

- (BOOL)confirmAttendance;
- (BOOL)cancelAttendance;

@optional // OPtional implementation. Before: Mandatory

- (void)attendanceStatus;

@end
