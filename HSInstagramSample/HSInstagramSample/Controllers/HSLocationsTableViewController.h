//
//  HSLocationsTableViewController.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-20.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSLocationService;

@interface HSLocationsTableViewController : UITableViewController

@property (nonatomic, strong) HSLocationService* locationService;
@property (nonatomic, strong) NSArray* locations;

@end
