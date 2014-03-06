//
//  LAMStundentsXMLService.m
//  lectures_management
//

#import "LAMStundentsXMLService.h"
#import "LAMStundent.h"

@interface LAMStundentsXMLService ()

@property (nonatomic, strong) NSMutableData *tmpData;
@property (nonatomic, strong) LAMStundent *tmpStundent;
@property (nonatomic, strong) NSMutableArray *returnArray;
@property (nonatomic, assign) id controller; //assign es una copia

@end

@implementation LAMStundentsXMLService

- (void)getStundentsXML:(id)aController{
  //Creamos la request, podemos indicar temas de caché
  // NSURLRequestReloadIgnoringLocalAndRemoteCacheData le indica a la parte local+remota que no queremos caché
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _controller = aController; //Guardamos el controlador que lo llama
  
  NSURL *url = [NSURL URLWithString:@"http://192.168.0.188:3000/stundents.xml"];
  
  NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                            timeoutInterval:15];
  
  NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
  [connection start];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  //Informar del error al controlador
  if ([_controller respondsToSelector:@selector(failData)]) {
    // Si ha fallado comprobamos que el controller responde a faildata y devolvemos el rror
    [_controller performSelector:@selector(failData) withObject:nil];
  }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  // Comprobamos que la response es http
  if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    int responseCode = httpResponse.statusCode;
    if (responseCode >= 300 ) {
      if ([_controller respondsToSelector:@selector(failData)]) {
        // Si ha fallado comprobamos que el controller responde a faildata y devolvemos el rror
        [_controller performSelector:@selector(failData) withObject:nil];
      }
    } else {
      _tmpData = [[NSMutableData alloc] init];      
    }
  }
}

// Cuando recibimos datos los vamos mentiendo en el temporal
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [_tmpData appendData:data];
}

//Cuando acabamos podemos lanzar el parser
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [self parseDocument:_tmpData];
  //Pasamos al controlador la info recogida
  
  if ([_controller respondsToSelector:@selector(setData)]) {
    // Si todo se ha ejecutado bien, comprobamos que el controlador responde a sendData y devolvemos los datos
    [_controller performSelector:@selector(setData) withObject:_returnArray];
  }
}

- (void) parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
     attributes:(NSDictionary *)attributeDict {
  //Detectar las etiquetas
  if([elementName isEqualToString:@"stundents"]){
    // Cuando empieza el xml inicializamos el array
    _returnArray = [[NSMutableArray alloc] init];
  } else if ([elementName isEqualToString:@"stundent"]){
    // Cuando empieza el alumno creamos un nuevo alumnos
    _tmpStundent = [[LAMStundent alloc] init];
  }
  
  [self clearContentsOfElement];
}

- (void) parser:(NSXMLParser *)parser
  didEndElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName {
  
  // Asignamos cada uno de los elementos.
  if ([elementName isEqualToString:@"name"]) {
    [_tmpStundent setName:_contentsOfElement];
  } else if ([elementName isEqualToString:@"lastname"]) {
    [_tmpStundent setSurname:_contentsOfElement];
  } else if ([elementName isEqualToString:@"email"]) {
    [_tmpStundent setEmail:_contentsOfElement];
  } else if ([elementName isEqualToString:@"city"]) {
    [_tmpStundent setCity:_contentsOfElement];
  } else if ([elementName isEqualToString:@"name"]) {
    [_tmpStundent setAvatarUrl:
     [@"http://192.168.188:3000" stringByAppendingString:_contentsOfElement]];
  }
  
  // Detectamos cuando cierra el alumno y lo borramos
  if ([elementName isEqualToString:@"stundent"]) {
    [_returnArray addObject:_tmpStundent];
    _tmpStundent = nil;
  }
  
  [self clearContentsOfElement];
}

@end
