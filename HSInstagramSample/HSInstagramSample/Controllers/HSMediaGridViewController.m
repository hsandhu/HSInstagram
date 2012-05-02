//
//  HSMediaGridViewController.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-21.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSMediaGridViewController.h"
#import "HSInstagramLocationMedia.h"
#import "HSImageViewController.h"

const NSInteger klocationThumbnailWidth = 80;
const NSInteger klocationThumbnailHeight = 80;
const NSInteger klocationImagesPerRow = 4;

@interface HSMediaGridViewController (private)
- (void)loadImages;
@end

@implementation HSMediaGridViewController

@synthesize gridScrollView = _gridScrollView;
@synthesize images = _images;
@synthesize thumbnails = _thumbnails;
@synthesize locationId = _locationId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLocationId:(NSString *)locationId
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        self.locationId = locationId;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    self.thumbnails = [[NSMutableArray alloc] init];
    self.gridScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.gridScrollView.contentSize = self.view.bounds.size;
    [self.view addSubview:self.gridScrollView];
    
    [HSInstagramLocationMedia getLocationMediaWithId:self.locationId block:^(NSArray *records) {
        self.images = records;
        int item = 0, row = 0, col = 0;
        for (NSDictionary* image in records) {
            UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(col*klocationThumbnailWidth,
                                                                          row*klocationThumbnailHeight,
                                                                          klocationThumbnailWidth,
                                                                          klocationThumbnailHeight)];
            button.tag = item;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            ++col;++item;
            if (col >= klocationImagesPerRow) {
                row++;
                col = 0;
            }
            [self.gridScrollView addSubview:button];
            [self.thumbnails addObject:button];
        }
        [self loadImages];
    }];
    
    self.title = @"photos";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.wantsFullScreenLayout = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - image loading

- (void)loadImages
{
    int item = 0;
    for (HSInstagramLocationMedia* media in self.images) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^ {
            NSString* thumbnailUrl = media.thumbnailUrl;
            NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:thumbnailUrl]];
            UIImage* image = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^ {
                UIButton* button = [self.thumbnails objectAtIndex:item];
                [button setImage:image forState:UIControlStateNormal];
            });
        });
        ++item;
    }
}

#pragma mark - button actions

- (void)buttonAction:(id)sender
{
    UIButton* button = sender;
    HSImageViewController* img = [[HSImageViewController alloc] initWithMedia:[self.images objectAtIndex:button.tag]];
    [self.navigationController pushViewController:img animated:YES];
}


@end
