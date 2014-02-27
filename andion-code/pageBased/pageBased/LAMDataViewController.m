//
//  LAMDataViewController.m
//  pageBased
//
//  Created by Lucas Andión Montáns on 21/02/14.
//  Copyright (c) 2014 Lucas Andión Montáns. All rights reserved.
//

#import "LAMDataViewController.h"

@interface LAMDataViewController ()

@end

@implementation LAMDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
