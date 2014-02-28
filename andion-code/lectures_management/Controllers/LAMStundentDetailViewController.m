//
//  LAMStundentDetailViewController.m
//  lectures_management
//

#import "LAMStundentDetailViewController.h"
#import "LAMStundent.h"

// Todo lo que va en interface es privado
@interface LAMStundentDetailViewController ()

  @property(nonatomic, strong) LAMStundent *stundent;

@end

@implementation LAMStundentDetailViewController

// Si viene de otra vista, mejor no tener que usarlo
// - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {

#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  
  [super viewWillAppear:animated];
  
  [_nameLabel setText:[_stundent fullName]];
  [_emailLabel setText:_stundent.email];
  [_cityLabel setText:_stundent.city];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods

- (void)loadData:(LAMStundent *)aStundent {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  _stundent = aStundent; // Esto mantiene asociado el alumno, no genera una copia
}

@end
