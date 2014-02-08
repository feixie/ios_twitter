//
//  Profile.h
//  twitter
//
//  Created by fxie on 2/7/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic, retain) NSDictionary *userProfile;
@property (nonatomic, retain) NSArray *tweetArray;

+(Profile *)getInstance;
+(Profile *)initWithProfile:(NSDictionary *)userProfile tweets:(NSArray *)tweetArray;


@end
