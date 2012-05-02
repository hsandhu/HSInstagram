//
//  HSMyMediaViewController.h
//  HSInstagramSample
//
//  Created by Harminder Sandhu on 12-05-01.
//  Copyright (c) 2012 Pushbits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSMyMediaViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView* webView;
@property (nonatomic, strong) UIScrollView* gridScrollView;
@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong) NSMutableArray* thumbnails;

@property (nonatomic, strong) NSString* accessToken;

@end
