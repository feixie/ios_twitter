//
//  Profile.m
//  twitter
//
//  Created by fxie on 2/7/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "Profile.h"

@implementation Profile

@synthesize userProfile;
static Profile *instance =nil;

+(Profile *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [Profile new];
        }
    }
    return instance;
}

+(Profile *)initWithProfile:(NSDictionary *)userProfile tweets:(NSArray *)tweetArray
{
    @synchronized(self)
    {
        instance= [Profile new];
        instance.userProfile = userProfile;
        instance.tweetArray = tweetArray;
    }
    return instance;
}

@end
