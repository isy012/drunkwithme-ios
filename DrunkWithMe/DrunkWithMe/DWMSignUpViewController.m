//
//  DWMSignUpViewController.m
//  DrunkWithMe
//
//  Created by Franklin Ho on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMSignUpViewController.h"
#import "UIColor+PXExtensions.h"

@interface DWMSignUpViewController ()

@end

@implementation DWMSignUpViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self.signUpView setBackgroundColor:[UIColor pxColorWithHexValue:@"#1FC219"]];
    
    self.signUpView.logo.hidden = YES;
    
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35.0f, 55.0f, 250.0f, 50.0f)];
    logoLabel.text = @"Drunk With Me";
    logoLabel.backgroundColor = [UIColor clearColor];
    logoLabel.textColor = [UIColor whiteColor];
    logoLabel.textAlignment = NSTextAlignmentCenter;
    logoLabel.font = [UIFont fontWithName:@"Gill Sans" size:32];
    
    [self.view addSubview:logoLabel];
    
    // Remove text shadow
    UITextField *textfield = self.signUpView.usernameField;
    textfield.layer.shadowOpacity = 0.0f;
    textfield.backgroundColor = [UIColor whiteColor];
    textfield = self.signUpView.passwordField;
    textfield.layer.shadowOpacity = 0.0f;
    textfield.backgroundColor = [UIColor whiteColor];
    textfield = self.signUpView.emailField;
    textfield.layer.shadowOpacity = 0.0f;
    textfield.backgroundColor = [UIColor whiteColor];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(55.0f, 212.0f, 210.0f, 1.0f)];
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
    
    UIView *lineView2 = [[UIView alloc] initWithFrame:CGRectMake(55.0f, 256.0f, 210.0f, 1.0f)];
    lineView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView2];
}


@end
