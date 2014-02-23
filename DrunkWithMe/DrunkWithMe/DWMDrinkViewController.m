//
//  DWMDrinkViewController.m
//  DrunkWithMe
//
//  Created by Franklin Ho on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMDrinkViewController.h"

@interface DWMDrinkViewController ()

- (IBAction)logDrink:(id)sender;

@end

@implementation DWMDrinkViewController

- (IBAction)logDrink:(id)sender
{
    PFUser *user = [PFUser currentUser];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Drinks"];
    [query whereKey:@"user" equalTo:user];
    NSLog(@"Count of objects: %d",[[query findObjects] count]);
    
    if ([[query findObjects] count] == 0){
        PFObject *drinks = [PFObject objectWithClassName:@"Drinks"];
        
        drinks[@"user"] = user;
        [drinks incrementKey:@"count"];
        [drinks save];
        
    } else {
        PFObject *drinks = [[query findObjects] objectAtIndex:0];
        [drinks incrementKey:@"count"];
        [drinks save];
    };
    
    
    
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
