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

    [self.favoritesLabel setText:[NSString stringWithFormat:@"%@", self.tweet.favoriteCount]];
    [self.retweetsLabel setText:[NSString stringWithFormat:@"%@", self.tweet.retweetCount]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (IBAction)favoriteButtonTapped:(UIButton *)sender
{
    [[TwitterClient instance] favoriteWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        // TODO Check for favoriting more than once?
        int currentFavorites = [self.tweet.favoriteCount intValue];
        int newFavorites = currentFavorites + 1;
        NSLog(@"Setting favorites to: %d", newFavorites);
        self.favoritesLabel.text = [NSString stringWithFormat:@"%d",newFavorites];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];

}

- (IBAction)retweetButtonTapped:(UIButton *)sender
{
    [[TwitterClient instance] retweetWithId:self.tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        // TODO Check for retweeting more than once?
        int currentRetweets = [self.tweet.retweetCount intValue];
        int newRetweets = currentRetweets + 1;
        NSLog(@"Setting retweets to: %d", newRetweets);
        self.retweetsLabel.text = [NSString stringWithFormat:@"%d",newRetweets];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

@end
