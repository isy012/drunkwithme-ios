//
//  DWMMapViewController.h
//  DrunkWithMe
//
//  Created by Rob McQueen on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface DWMMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end
