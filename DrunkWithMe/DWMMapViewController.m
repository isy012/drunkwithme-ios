//
//  DWMMapViewController.m
//  DrunkWithMe
//
//  Created by Rob McQueen on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "DWMMapView.h"
#import "DWMLogInViewController.h"
#import "DWMSignUpViewController.h"

@interface DWMMapViewController ()

@end

@implementation DWMMapViewController

- (void)loadView
{
    NSLog(@"Loading View");
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    DWMMapView *v = [[DWMMapView alloc] initWithFrame:frame];
    
    [self setView:v];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dispatch_async(dispatch_get_main_queue(), ^{
        _mapView.myLocationEnabled = YES;
    });
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:0
                                                            longitude:0
                                                                 zoom:1];
    _mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    [_mapView addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    self.view = _mapView;

}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
    _mapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                     zoom:14];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    if ([PFUser currentUser]){
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged In!" message:@"Logged in!" delegate:nil cancelButtonTitle:@"Log me out" otherButtonTitles:nil, nil];
//        [alert show];
//        [PFUser logOut];
//    }
    
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
