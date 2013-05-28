//
//  HSInstagramUserMedia.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-05-01.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSInstagramUserMedia : NSObject

@property (nonatomic, strong) NSString* thumbnailUrl;
@property (nonatomic, strong) NSString* standardUrl;
@property (nonatomic, assign) NSUInteger likes;

+ (void)getUserMediaWithId:(NSString*)userId
           withAccessToken:(NSString*)accessToken
                     block:(void (^)(NSArray *records))block;


@end
