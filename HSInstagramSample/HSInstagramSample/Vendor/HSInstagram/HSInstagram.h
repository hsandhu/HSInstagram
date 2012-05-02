//
//  HSInstagram.h
//  HSInstagram
//
//  Created by Harminder Sandhu on 12-01-18.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

extern NSString * const kInstagramBaseURLString;
extern NSString * const kClientId;
extern NSString * const kRedirectUrl;

// Endpoints
extern NSString * const kLocationsEndpoint;
extern NSString * const kLocationsMediaRecentEndpoint;
extern NSString * const kUserMediaRecentEndpoint;
extern NSString * const kAuthenticationEndpoint;

@interface HSInstagram : AFHTTPClient

+ (HSInstagram *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

@end
