//
//  DWMAppDelegate.m
//  DrunkWithMe
//
//  Created by Franklin Ho on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMAppDelegate.h"
#import <Parse/Parse.h>
#import "DWMViewController.h"
#import "DWMSignUpViewController.h"

@implementation DWMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [Parse setApplicationId:@"U6PVJdxGzxs9Bz2W6QSgH42Xb8aTZ5Am0ngu2bX4"
                  clientKey:@"xyFKmeXTxo1xyx3FeOdrDFz0xL259OtcW9tjGPsd"];

    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [PFTwitterUtils initializeWithConsumerKey:@"Grb8JD9JQ8bCAAaUoeOIg"
                               consumerSecret:@"O1Pj7V1GMKFRiZ1nIInkZ9zeRRtMU58M35419hhGl8"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    DWMViewController *dwmvc = [[DWMViewController alloc] init];
    
    DWMSignUpViewController *suvc = [[DWMSignUpViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[dwmvc,suvc]];

    [[self window] setRootViewController:tabBarController];
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
