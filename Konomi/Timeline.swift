//
//  Timeline.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/04/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

struct Timeline {
    private var tweets: [Tweet] = []
    
    init(tweets: [Tweet]) {
        self.tweets = tweets
    }
    
    var numberOfTweet: Int {
        return tweets.count
    }
    
    subscript(index: Int) -> Tweet {
        return tweets[index]
    }
    
    private func insertTweetAtIndex(tweet: Tweet, index: Int) -> Timeline {
        var mutableTweets = tweets
        mutableTweets.insert(tweet, atIndex: index)
        return Timeline(tweets: mutableTweets)
    }
    
    private func deleteTweetAtIndex(tweet: Tweet, index: Int) -> Timeline {
        var mutableTweets = tweets
        mutableTweets.removeAtIndex(index)
        return Timeline(tweets: mutableTweets)
    }
    
    func favoriteTweetAtIndex(index: Int) -> Timeline {
        var mutableTweets = tweets
        mutableTweets[index].favorited = !mutableTweets[index].favorited
        return Timeline(tweets: mutableTweets)
    }
    
    func retweetTweetAtIndex(index: Int) -> Timeline {
        var mutableTweets = tweets
        mutableTweets[index].retweeted = !mutableTweets[index].retweeted
        return Timeline(tweets: mutableTweets)
    }
}