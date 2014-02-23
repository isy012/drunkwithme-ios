//
//  DWMLogInViewController.m
//  DrunkWithMe
//
//  Created by Franklin Ho on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMLogInViewController.h"
#import "UIColor+PXExtensions.h"

@interface DWMLogInViewController ()

@property (nonatomic, strong)UIImageView *fieldsBackground;

@end

@implementation DWMLogInViewController

@synthesize fieldsBackground;


- (void)viewDidLoad
{
    [super viewDidLoad];
//
    self.logInView.logo.hidden = YES;
    
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35.0f, 55.0f, 250.0f, 50.0f)];
    logoLabel.text = @"Drunk With Me";
    logoLabel.backgroundColor = [UIColor clearColor];
    logoLabel.textColor = [UIColor whiteColor];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.font = [UIFont fontWithName:@"Gill Sans" size:32];

    [self.view addSubview:logoLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(55.0f, 164.0f, 210.0f, 1.0f)];
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
    
    [self.logInView setBackgroundColor:[UIColor pxColorWithHexValue:@"#1FC219"]];
//    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]]];
//    
//    // Set buttons appearance
//    [self.logInView.dismissButton setImage:[UIImage imageNamed:@"Exit.png"] forState:UIControlStateNormal];
//    [self.logInView.dismissButton setImage:[UIImage imageNamed:@"ExitDown.png"] forState:UIControlStateHighlighted];
//    
//    [self.logInView.facebookButton setImage:nil forState:UIControlStateNormal];
//    [self.logInView.facebookButton setImage:nil forState:UIControlStateHighlighted];
//    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"FacebookDown.png"] forState:UIControlStateHighlighted];
//    [self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"Facebook.png"] forState:UIControlStateNormal];
//    [self.logInView.facebookButton setTitle:@"" forState:UIControlStateNormal];
//    [self.logInView.facebookButton setTitle:@"" forState:UIControlStateHighlighted];
//    
//    [self.logInView.twitterButton setImage:nil forState:UIControlStateNormal];
//    [self.logInView.twitterButton setImage:nil forState:UIControlStateHighlighted];
//    [self.logInView.twitterButton setBackgroundImage:[UIImage imageNamed:@"Twitter.png"] forState:UIControlStateNormal];
//    [self.logInView.twitterButton setBackgroundImage:[UIImage imageNamed:@"TwitterDown.png"] forState:UIControlStateHighlighted];
//    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateNormal];
//    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateHighlighted];
//    
//    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"Signup.png"] forState:UIControlStateNormal];
//    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"SignupDown.png"] forState:UIControlStateHighlighted];
//    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateNormal];
//    [self.logInView.signUpButton setTitle:@"" forState:UIControlStateHighlighted];
//    
    // Add login field background
//    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldBG.png"]];
//    [self.logInView addSubview:self.fieldsBackground];
//    [self.logInView sendSubviewToBack:self.fieldsBackground];
    
    // Remove text shadow
    UITextField *textfield = self.logInView.usernameField;
    textfield.layer.shadowOpacity = 0.0f;
    textfield.backgroundColor = [UIColor whiteColor];
    textfield = self.logInView.passwordField;
    textfield.layer.shadowOpacity = 0.0f;
    textfield.backgroundColor = [UIColor whiteColor];
    UILabel *label = self.logInView.externalLogInLabel;
    label.textColor =[UIColor whiteColor];
    label.shadowColor =nil;
    label = self.logInView.signUpLabel;
    label.textColor =[UIColor whiteColor];
    label.shadowColor =nil;
    
    
    
    
    // Make label text white
    
//
//    // Set field text color
//    [self.logInView.usernameField setTextColor:[UIColor whiteColor]];
//    [self.logInView.passwordField setTextColor:[UIColor whiteColor]];
//}

    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Set frame for elements
//    [self.logInView.dismissButton setFrame:CGRectMake(10.0f, 10.0f, 87.5f, 45.5f)];
//    [self.logInView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
    [self.logInView.facebookButton setFrame:CGRectMake(35.0f, 307.0f, 120.0f, 40.0f)];
    [self.logInView.twitterButton setFrame:CGRectMake(35.0f+130.0f, 307.0f, 120.0f, 40.0f)];
    [self.logInView.signUpButton setFrame:CGRectMake(35.0f, 385.0f, 250.0f, 40.0f)];
    [self.logInView.usernameField setFrame:CGRectMake(35.0f, 115.0f, 250.0f, 50.0f)];
    [self.logInView.passwordField setFrame:CGRectMake(35.0f, 165.0f, 250.0f, 50.0f)];
    [self.fieldsBackground setFrame:CGRectMake(35.0f, 115.0f, 250.0f, 100.0f)];
    [self.logInView.logInButton setFrame:CGRectMake(35.0f, 225.0f, 250.0f, 50.0f)];
    [self.logInView.signUpLabel setFrame:CGRectMake(35.0f, 339.0f, 250.0f, 50.0f)];
    [self.logInView.passwordForgottenButton setFrame:CGRectMake(16.0f, 140.0f, 20.0f, 50.0f)];
}



@end
