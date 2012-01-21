//
//  HSInstagramLocation.m
//  Instagram
//
//  Created by Harminder Sandhu on 12-01-18.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagramLocation.h"
#import "HSInstagram.h"

@implementation HSInstagramLocation

@synthesize locationId = _locationId;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize name = _name;


- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.name = [attributes valueForKeyPath:@"name"];
    self.locationId = [attributes valueForKeyPath:@"id"];
    self.latitude = [attributes valueForKeyPath:@"lat"];
    self.longitude = [attributes valueForKeyPath:@"lng"];
    return self;
}

+ (void)getLocationsWithCoord:(CLLocationCoordinate2D)coord block:(void (^)(NSArray *records))block
{
    NSString* lat = [NSString stringWithFormat:@"%3.7f", coord.latitude];
    NSString* lon = [NSString stringWithFormat:@"%3.7f", coord.longitude];
    
    NSDictionary* params = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:lat, lon, kClientId, nil]
                                                       forKeys:[NSArray arrayWithObjects:@"lat", @"lng", @"client_id", nil]];
    
    [[HSInstagram sharedClient] getPath:kLocationsEndpoint
                             parameters:params
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    NSMutableArray *mutableRecords = [NSMutableArray array];
                                    NSArray* data = [responseObject objectForKey:@"data"];
                                    for (NSDictionary* obj in data) {
                                        HSInstagramLocation* location = [[HSInstagramLocation alloc] initWithAttributes:obj];
                                        [mutableRecords addObject:location];
                                    }
                                    if (block) {
                                        block([NSArray arrayWithArray:mutableRecords]);
                                    }
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    NSLog(@"error: %@", error.localizedDescription);
                                    if (block) {
                                        block([NSArray array]);
                                    }
                                }];
}

@end
