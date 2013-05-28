//
//  HSInstagramLocation.h
//  Instagram
//
//  Created by Harminder Sandhu on 12-01-18.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface HSInstagramLocation : NSObject

@property (nonatomic, strong) NSString* locationId;
@property (nonatomic, strong) NSString* latitude;
@property (nonatomic, strong) NSString* longitude;
@property (nonatomic, strong) NSString* name;

+ (void)getLocationsWithCoord:(CLLocationCoordinate2D)coord
              withAccessToken:(NSString*)accessToken
                        block:(void (^)(NSArray *records))block;

@end
