//
//  DWMViewController.m
//  DrunkWithMe
//
//  Created by Franklin Ho on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMViewController.h"
#import "DWMLogInViewController.h"
#import "DWMSignUpViewController.h"

@interface DWMViewController ()

@end

@implementation DWMViewController

- (void)viewDidLoad
{
    
    
//    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
//        if (!user) {
//            NSLog(@"Uh oh. The user cancelled the Twitter login.");
//            return;
//        } else if (user.isNew) {
//            NSLog(@"User signed up and logged in with Twitter!");
//        } else {
//            NSLog(@"User logged in with Twitter!");
//        }
//    }];
    
//    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
//        if (!error) {
//            // do something with the new geoPoint
//        }
//    }];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [super viewDidAppear:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([PFUser currentUser]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged In!" message:@"Logged in!" delegate:nil cancelButtonTitle:@"Log me out" otherButtonTitles:nil, nil];
        [alert show];
        [PFUser logOut];
    }
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        DWMLogInViewController *logInViewController = [[DWMLogInViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Create the sign up view controller
         DWMSignUpViewController *signUpViewController = [[DWMSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        logInViewController.fields = PFLogInFieldsUsernameAndPassword
        | PFLogInFieldsLogInButton
        | PFLogInFieldsSignUpButton
        | PFLogInFieldsPasswordForgotten
        | PFLogInFieldsFacebook
        | PFLogInFieldsTwitter;
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
    
    
}

- (void)logInViewController:(DWMLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)logInViewControllerDidCancelLogIn:(DWMLogInViewController *)logInController
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)signUpViewController:(DWMLogInViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)signUpViewControllerDidCancelSignUp:(DWMLogInViewController *)signUpController
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
