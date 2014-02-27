//
//  LAMViewController.m
//  lolView
//

#import "LAMViewController.h"

@interface LAMViewController ()

@end

@implementation LAMViewController

// CICLO DE VIDA:
//2014-02-21 12:32:56.183 lolView[16540:70b] -[LAMViewController viewDidAppear:] (line:25)
//2014-02-21 12:33:07.532 lolView[16540:70b] -[LAMViewController viewWillAppear:] (line:18)
//2014-02-21 12:33:08.037 lolView[16540:70b] -[LAMViewController viewDidAppear:] (line:25)
//2014-02-21 12:33:11.465 lolView[16540:70b] -[LAMViewController viewDidLoad] (line:35)
//2014-02-21 12:33:11.466 lolView[16540:70b] -[LAMViewController viewWillAppear:] (line:18)
//2014-02-21 12:33:11.978 lolView[16540:70b] -[LAMViewController viewDidAppear:] (line:25)
//2014-02-21 12:33:19.393 lolView[16540:70b] -[LAMViewController viewDidLoad] (line:35)


// Metodos opcionales

- (void)viewWillAppear:(BOOL)animated {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewWillAppear:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  // Las cosas que sólo se van a hacer UNA vez al comienzo de la app
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  [super viewDidAppear:YES];
}

// Metodos que hay que kmplementar siempre

// Solo se ejecuta una vez, si tenemos que poner una vista que se cargue cada vez no podemos usarlo
- (void)viewDidLoad {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
