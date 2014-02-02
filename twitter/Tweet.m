//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)timestamp {
    return [self.data valueOrNilForKeyPath:@"created_at"];
}

- (NSString *)favoriteCount {
    return [self.data valueOrNilForKeyPath:@"favorite_count"];
}

- (NSString *)retweetCount {
    return [self.data valueOrNilForKeyPath:@"retweet_count"];
}

- (NSString *)name {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"name"];
}

- (NSString *)profileImageUrl {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"profile_image_url"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
