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
    
    private func deleteTweetAtIndex(index: Int) -> Timeline {
        var mutableTweets = tweets
        mutableTweets.removeAtIndex(index)
        return Timeline(tweets: mutableTweets)
    }
    
    func favoriteTweetAtIndex(index: Int) -> Timeline {
        let id = tweets[index].id
        let text = tweets[index].text
        let favorited = tweets[index].favorited
        let retweeted = tweets[index].retweeted
        let user = tweets[index].user
        
        let tweet = Tweet(id: id, text: text, favorited: !favorited, retweeted: retweeted, user: user)
        
        var mutableTweets = tweets
        mutableTweets[index] = tweet
        
        return Timeline(tweets: mutableTweets)
    }
    
    func retweetTweetAtIndex(index: Int) -> Timeline {
        let id = tweets[index].id
        let text = tweets[index].text
        let favorited = tweets[index].favorited
        let retweeted = tweets[index].retweeted
        let user = tweets[index].user
        
        let tweet = Tweet(id: id, text: text, favorited: favorited, retweeted: !retweeted, user: user)
        
        var mutableTweets = tweets
        mutableTweets[index] = tweet
        
        return Timeline(tweets: mutableTweets)
    }
}