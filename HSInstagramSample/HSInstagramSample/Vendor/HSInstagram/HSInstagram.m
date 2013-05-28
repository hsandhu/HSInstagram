//
//  HSInstagram.m
//  HSInstagram
//
//  Created by Harminder Sandhu on 12-01-18.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSInstagram.h"

#import "AFJSONRequestOperation.h"

NSString * const kInstagramBaseURLString = @"https://api.instagram.com/v1/";
#warning Include your client id from instagr.am
NSString * const kClientId = @"INSTAGRAM-CLIENT-KEY";

#warning Include your redirect uri
NSString * const kRedirectUrl = @"http://example.com";


// Endpoints
NSString * const kLocationsEndpoint = @"locations/search";
NSString * const kLocationsMediaRecentEndpoint = @"locations/%@/media/recent";
NSString * const kUserMediaRecentEndpoint = @"users/%@/media/recent";
NSString * const kAuthenticationEndpoint = 
    @"https://instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token";

@implementation HSInstagram

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithBaseURL:(NSURL *)url 
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

+ (HSInstagram *)sharedClient 
{
    static HSInstagram * _sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kInstagramBaseURLString]];
    });
    
    return _sharedClient;
}

@end
