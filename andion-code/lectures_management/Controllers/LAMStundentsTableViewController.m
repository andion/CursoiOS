//
//  LAMStundentsTableViewController.m
//  lectures_management
//
//  Created by Lucas Andión Montáns on 27/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import "LAMStundentsTableViewController.h"
#import "LAMStundent.h"
#import "LAMStundentCell.h"
#import "LAMStundentDetailViewController.h"

@interface LAMStundentsTableViewController ()
  // Todo lo que metemos aquí será privado
  @property(nonatomic, strong)NSMutableArray *stundents; //Mutable pq lo vamos a modificar
@end

@implementation LAMStundentsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    [super viewDidLoad];
  
  self.clearsSelectionOnViewWillAppear = YES; // Limpia la seleccion para que no nos quede ninguna celda seleccionada

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  
  // Creamos alimnos de prueba pa meter en el array
  
  _stundents = [[NSMutableArray alloc] init];
  
  [self loadData];
  
}

- (void)didReceiveMemoryWarning
{
    //Niveles de aviso de memoria: 1, 2 y 3
    [super didReceiveMemoryWarning];
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1; // 1 sección
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section - depende del tamanho del array.
  if(section == 0){
    return [_stundents count];
  } else {
    return 0;
  }
}

//Devuelve un tableview cell en funcion de un índice. indexPath es un enum
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  // Saca de la cola una celda que se pueda reutilizar con el id que le pasemos
  
  LAMStundentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  LAMStundent *tmp = [_stundents objectAtIndex:indexPath.row];
  // Configure the cell... Aquí es donde le decimos que ponemos en cada celda
  [cell.nameLabel setText:[tmp fullName]];
  [cell.cityLabel setText:tmp.city];
  [cell.emailLabel setText:tmp.email];
  
  return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
// Se ejecuta ANTES de hacer la navegación. Aquí vemos que elemento se ha seleccionado, nos
// da su index y en función de eso cogemos el controlador destino y pasamos el objeto

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  
  // Primero vemos que elemento se ha seleccionado en la vista con un metodo de la table.
  NSIndexPath *selected = [self.tableView indexPathForSelectedRow];

  // Lo copiamos a un temporal
  LAMStundent *tmp = [_stundents objectAtIndex:selected.row];
  
  //Identificamos el segue (El 'show_detail' lo hemos puesto en el identificador en el storyboard
  if([segue.identifier isEqualToString:@"show_detail"]) {
    LAMStundentDetailViewController *destinationController = segue.destinationViewController;
    
    [destinationController performSelector:@selector(loadData:) withObject:tmp];
    
    // // Tb se puede hacer generico así
    // id destinationcontroller = destinationController = segue.destinationViewController;
    // // Y luego comprobando que responde al metodo que necesitamos (pq podria ser cualquier controlador)
    //    if([destinationController respondsToSelector:@selector(loadData:)]){
    //      [destinationController performSelector:@selector(loadData:) withObject:tmp];
    //    }
  }
  
}

#pragma mark - Métodos privados

- (void)loadData{
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSData *stundentsData = [userDefaults objectForKey:@"stundents"];
  _stundents = [NSKeyedUnarchiver unarchiveObjectWithData:stundentsData];
}

@end
