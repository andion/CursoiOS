//
//  LAMLecturesJsonService.m
//  lectures_management
//

#import "AFNetworking.h"
#import "LAMLecture.h"
#import "LAMLecturesJsonService.h"

@interface LAMLecturesJsonService ()

@property (nonatomic, assign) id controller;
@property (nonatomic, strong) NSMutableArray *returnArray;

@end

@implementation LAMLecturesJsonService

// Para que cq controlador pueda acceder a el
- (void)getLecturesForController:(id)aController{
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _controller = aController;
  NSURL*url = [NSURL URLWithString:@"http://192.168.0.188:3000/aecomo_classes.json"];
  NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
  
  AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:req];
  //Indicamos quien va a llevar a cabo la serializacion
  [op setResponseSerializer:[AFJSONResponseSerializer serializer] ];
  
  [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    if ([_controller respondsToSelector:@selector(setData:)]) {
      // Si ha fallado comprobamos que el controller responde a faildata y devolvemos el rror
      [_controller performSelector:@selector(setData:) withObject:_returnArray];
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    if ([_controller respondsToSelector:@selector(failData)]) {
      [_controller performSelector:@selector(failData) withObject:nil];
    }
  }];

/* Alternativa 1: lanzarla directamente: */

  [op start];

/* Alternativa 2: Usar la cola principal
  [[NSOperationQueue mainQueue] addOperation:op]; // Lo agrega a la cola principal y cuando le toque lo ejecuta
*/
  
/* Alternativa 3: Crear nuestra propia cola
  NSOperationQueue *networkQueue = [[NSOperationQueue alloc] init];
  [networkQueue setName:@"network"];   // Con este ID podemos seleccionar esta cola desde otro pto
  [networkQueue setMaxConcurrentOperationCount:2]; // Cuantas op a la vez
  [networkQueue addOperation:op];
*/ 
}

- (void)parseJson:(id)JSON {
  _returnArray = [[NSMutableArray alloc] init];
  for (NSDictionary *dic in JSON){
    LAMLecture *tmp = [[LAMLecture alloc] initWithDic:dic];
    [_returnArray addObject:tmp];    
  }
}

@end
