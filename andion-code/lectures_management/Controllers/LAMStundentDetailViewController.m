//
//  LAMStundentDetailViewController.m
//  lectures_management
//

#import "LAMStundentDetailViewController.h"
#import "LAMStundent.h"
#import "UIImageView+AFNetworking.h"

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
  
  // Crear la url con el string de la imagen
  // llamar a la propiedad del imageview para q cargue la imagen desde la url
  NSURL *imgUrl = [NSURL URLWithString:_stundent.avatarUrl];
  [_avatarImageView setImageWithURL:imgUrl
                   placeholderImage:[UIImage imageNamed:@"profile-placeholder.png"]];
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
