//
//  TweetDetailVCViewController.m
//  twitter
//
//  Created by fxie on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "TweetDetailVC.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "ComposeViewController.h"

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
    self.screenNameLabel.text = [@"@" stringByAppendingString:self.tweet.screenName];

    NSString *dateString = [NSDateFormatter localizedStringFromDate:self.tweet.timestamp
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterShortStyle];
    self.timestampLabel.text = dateString;
    self.textLabel.text = self.tweet.text;
        
    NSString *imageUrl = self.tweet.profileImageUrl;
    [self.profilePictureImage setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];

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
        [self.tweet setFavoriteCount:[NSNumber numberWithInteger:newFavorites]];
        [self.favoritesLabel setText:[NSString stringWithFormat:@"%@", self.tweet.favoriteCount]];
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
        [self.tweet setRetweetCount:[NSNumber numberWithInteger:newRetweets]];
        [self.retweetsLabel setText:[NSString stringWithFormat:@"%@", self.tweet.retweetCount]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

- (IBAction)replyButtonTapped:(UIButton *)sender
{
    ComposeViewController *composeVC = [[ComposeViewController alloc] init];
    composeVC.replyTo = self.tweet.tweetId;
    [self.navigationController pushViewController:composeVC animated:YES];

}

@end
