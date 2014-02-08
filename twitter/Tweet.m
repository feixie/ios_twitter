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

- (NSDate *)timestamp {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    });

    NSString *createdAtString = [self.data valueForKey:@"created_at"];
    return[dateFormatter dateFromString:createdAtString];
}

- (NSNumber *)favoriteCount {
    return [self.data valueOrNilForKeyPath:@"favorite_count"];
}

- (void)setFavoriteCount: (NSNumber *)newCount {
    NSMutableDictionary *temp = [self.data mutableCopy];
    [temp setObject:newCount forKey:@"favorite_count"];
    
    self.data = [temp copy];
}

- (NSNumber *)retweetCount {
    return [self.data valueOrNilForKeyPath:@"retweet_count"];
}

- (void)setRetweetCount: (NSNumber *)newCount {
    NSMutableDictionary *temp = [self.data mutableCopy];
    [temp setObject:newCount forKey:@"retweet_count"];
    
    self.data = [temp copy];
}

- (NSString *)name {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"name"];
}

- (NSString *)screenName {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"screen_name"];
}

- (NSString *)profileImageUrl {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"profile_image_url"];
}

- (NSNumber *)tweetId {
    return [self.data valueOrNilForKeyPath:@"id"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSMutableDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
