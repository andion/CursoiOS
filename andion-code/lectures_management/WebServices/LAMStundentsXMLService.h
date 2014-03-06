//
//  LAMStundentsXMLService.h
//  lectures_management
//

#import "BaseXmlParser.h"

//Aqui tendriamos que implementar los delegados del parser xmk, pero ya los esta implementando BaseXmlParser. Así que solo vamos a implementar el ConnectionDelegate y el ConnectionDataDelegate.

@interface LAMStundentsXMLService : BaseXmlParser <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

- (void)getStundentsXML:(id)aController;

@end
