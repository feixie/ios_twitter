//
//  ComposeViewController.m
//  twitter
//
//  Created by fxie on 2/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Profile.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

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
    
    NSDictionary *userProfile = [Profile getInstance].userProfile;
    self.nameLabel.text = [userProfile valueOrNilForKeyPath:@"name"];
    self.screenNameLabel.text = [@"@" stringByAppendingString:[userProfile valueOrNilForKeyPath:@"screen_name"]];

    
    NSString *imageUrl = [userProfile valueOrNilForKeyPath:@"profile_image_url"];
    
    [self.profilePictureImage setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"placeholder-avatar"]];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweetButton)];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)onTweetButton {
    NSLog(@"in on tweet button");
    
    [self.view endEditing:YES];

    [[TwitterClient instance] tweetWithText:self.tweetTextView.text replyTo:self.replyTo success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"new tweet: %@", response);
        NSMutableArray *mutableTweets = [(NSArray*)[Profile getInstance].tweetArray mutableCopy];
        [mutableTweets insertObject:[[Tweet alloc] initWithDictionary:response] atIndex:0];
        [Profile getInstance].tweetArray = [NSArray arrayWithArray:mutableTweets];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"tweet failed: %@", error);
    }];
    
}

@end
