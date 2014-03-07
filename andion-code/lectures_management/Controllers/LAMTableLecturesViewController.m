//
//  LAMTableLecturesViewController.m
//  lectures_management
//
//  Created by Lucas Andión Montáns on 06/03/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import "LAMTableLecturesViewController.h"
#import "LAMLecture.h"
#import "LAMLecturesJsonService.h"
#import "LAMLectureCell.h"

@interface LAMTableLecturesViewController ()
@property (nonatomic, strong) NSArray *lectures;
@end

@implementation LAMTableLecturesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.clearsSelectionOnViewWillAppear = NO;
  _lectures = [[NSArray alloc] init];
  [self loadData];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  // Una única sección
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // La sección tendrá el tamaño del número de lectures que tnemos
  return [_lectures count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"LecturesCell";
  LAMLectureCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier
                                                         forIndexPath:indexPath];
  LAMLecture *tmp = [_lectures objectAtIndex:indexPath.row];
  [cell.nameLabel setText:tmp.name];
  [cell.startsAtLabel setText:tmp.startsAt];
  [cell.endsAtLabel setText:tmp.endsAt];
    
  return cell;
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Provate Methods

- (void)loadData {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  LAMLecturesJsonService *ws = [[LAMLecturesJsonService alloc] init];
  [ws getLecturesForController:self];
}

-(void)setData:(NSMutableArray *)anArray {
#ifndef NDEBUG
  NSLog(@"%s (line:%d)", __PRETTY_FUNCTION__, __LINE__);
#endif
  // Carga asíncrona de datos, por lo que tenemos que crear los objetos para almacenarlo
  _lectures = [NSArray arrayWithArray:anArray];
  
  [self.tableView reloadData]; // Ejecuta de nuevo el dataSource
}

-(void)failData{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                  message:@"Error when loading lectures"
                                                 delegate:nil
                                        cancelButtonTitle:@"LOL that"
                                        otherButtonTitles:nil];
  [alert show];
}


@end
