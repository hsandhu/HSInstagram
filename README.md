#### Overview

This repository provides a starting point to build an application based on the Instagram platform.  In addition to the Instagram API model, the respository includes a sample iOS project.

#### Requirements

iOS 5 with ARC enabled

#### Dependencies (included)

AFNetworking


#### Installation

Simply copy the /Vendor/HSInstagram source files from the sample project into your XCode project

#### Sample Usage

Retrieving images for a specific location:

CLLocationCoordinate2D coord = self.locationService.currentLocation.coordinate;
        [HSInstagramLocation getLocationsWithCoord:coord block:^(NSArray *records) {
            self.locations = records;
            [self.tableView reloadData];
        }];