//
//  HSMediaGridViewController.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-21.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSMediaGridViewController : UIViewController

- (id)initWithLocationId:(NSString*)locationId;

@property (nonatomic, strong) NSString* locationId;
@property (nonatomic, strong) UIScrollView* gridScrollView;
@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong) NSMutableArray* thumbnails;

@end
