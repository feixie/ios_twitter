//
//  TweetDetailVCViewController.h
//  twitter
//
//  Created by fxie on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetDetailVC : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView * profilePictureImage;
@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * timestampLabel;
@property (nonatomic, weak) IBOutlet UILabel * textLabel;
@property (nonatomic, weak) IBOutlet UILabel * favoritesLabel;
@property (nonatomic, weak) IBOutlet UILabel * retweetsLabel;


@property (nonatomic, strong) Tweet *tweet;



@end
