//
//  DWMMapViewController.m
//  DrunkWithMe
//
//  Created by Rob McQueen on 2/22/14.
//  Copyright (c) 2014 Obsidian Mobile. All rights reserved.
//

#import "DWMMapViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface DWMMapViewController ()

@end

@implementation DWMMapViewController

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

@end
