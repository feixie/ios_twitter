//
//  TweetDetailVCViewController.m
//  twitter
//
//  Created by fxie on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweetDetailVC.h"

@interface TweetDetailVC ()

@end

@implementation TweetDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameLabel.text = self.tweet.name;
    self.timestampLabel.text = self.tweet.timestamp;
    self.textLabel.text = self.tweet.text;
    self.favoritesLabel.text = self.tweet.favoriteCount;
    self.retweetsLabel.text = self.tweet.retweetCount;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
