//
//  HSLocationService.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

extern NSInteger const kDistanceFilter;

@interface HSLocationService : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocation* currentLocation;
@property (nonatomic, strong) CLLocationManager* locationManager;

- (void)start;
- (void)stop;

@end
