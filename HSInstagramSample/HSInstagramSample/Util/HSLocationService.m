//
//  HSLocationService.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSLocationService.h"

NSInteger const kDistanceFilter = 25;

@implementation HSLocationService

@synthesize currentLocation = _currentLocation;
@synthesize locationManager = _locationManager;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kDistanceFilter;
    }
    
    return self;
}

- (void)start 
{
	[self.locationManager startUpdatingLocation];
}

- (void)stop 
{
	[self.locationManager stopUpdatingLocation];
}

#pragma mark - location delegates

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation 
{
    // invalid measurement
    if (newLocation.horizontalAccuracy < 0) return;
    
    self.currentLocation = newLocation;
    [[NSNotificationCenter defaultCenter] postNotificationName:kNewLocationNotification object:nil];
}

// TODO: handle error case
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
    NSLog(@"error:%@", error.localizedDescription);
}

@end
