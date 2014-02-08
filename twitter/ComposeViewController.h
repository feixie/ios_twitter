//
//  ComposeViewController.h
//  twitter
//
//  Created by fxie on 2/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextView * tweetTextView;
@property (nonatomic, weak) IBOutlet UIImageView * profilePictureImage;
@property (nonatomic, weak) IBOutlet UILabel * nameLabel;
@property (nonatomic, weak) IBOutlet UILabel * screenNameLabel;


@property (nonatomic, strong) NSNumber * replyTo;

@end
