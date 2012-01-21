//
//  HSImageViewController.m
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-01-21.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import "HSImageViewController.h"
#import "HSInstagramLocationMedia.h"
#import <QuartzCore/QuartzCore.h>

@implementation HSImageViewController

@synthesize media = _media;
@synthesize imageView = _imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMedia:(HSInstagramLocationMedia *)media
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        self.media = media;
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
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageView.backgroundColor = [UIColor blackColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    self.navigationItem.title = @"photo";
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^ {
        NSString* imageUrl = self.media.standardUrl;
        NSData* data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage* image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            self.imageView.image = image;
            
            // Add some 'likes' meta data to the photo view
            NSUInteger likes = self.media.likes;
            NSString* text = [NSString stringWithFormat: @"%d LIKES", likes];
            CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:10.0]];
            CGRect bounds = self.view.bounds;
            UILabel* likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(bounds.origin.x + 10,
                                                                            bounds.size.height - 50,
                                                                            size.width + 10,
                                                                            size.height + 10)];
            likesLabel.text = text;
            likesLabel.backgroundColor = [UIColor darkGrayColor];
            likesLabel.textColor = [UIColor whiteColor];
            likesLabel.font = [UIFont systemFontOfSize:10.0];
            likesLabel.layer.cornerRadius = 5.0;
            likesLabel.textAlignment = UITextAlignmentCenter;
            likesLabel.alpha = 0.0;
            [self.view addSubview:likesLabel];
            
            [UIView animateWithDuration:1.0 animations:^{
                likesLabel.alpha = 1.0;
            }];
            
        });
    });
    
    self.navigationController.wantsFullScreenLayout = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
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

@end
