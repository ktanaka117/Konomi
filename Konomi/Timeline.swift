//
//  Timeline.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/04/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Foundation

struct Timeline: DataType {
    typealias ItemType = Tweet
    
    var items: [ItemType] = []
    
    init(items: [ItemType]) {
        self.items = items
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    subscript(index: Int) -> Tweet {
        return items[index]
    }
    
    func insertItemAtIndex(item: ItemType, index: Int) -> Timeline {
        var mutableTweets = items
        mutableTweets.insert(item, atIndex: index)
        return Timeline(items: mutableTweets)
    }
    
    func deleteItemAtIndex(index: Int) -> Timeline {
        var mutableTweets = items
        mutableTweets.removeAtIndex(index)
        return Timeline(items: mutableTweets)
    }
    
    func favoriteTweetAtIndex(index: Int) -> Timeline {
        let id = items[index].id
        let text = items[index].text
        let favorited = items[index].favorited
        let retweeted = items[index].retweeted
        let user = items[index].user
        
        let tweet = Tweet(id: id, text: text, favorited: !favorited, retweeted: retweeted, user: user)
        
        var mutableTweets = items
        mutableTweets[index] = tweet
        
        return Timeline(items: mutableTweets)
    }
    
    func retweetTweetAtIndex(index: Int) -> Timeline {
        let id = items[index].id
        let text = items[index].text
        let favorited = items[index].favorited
        let retweeted = items[index].retweeted
        let user = items[index].user
        
        let tweet = Tweet(id: id, text: text, favorited: favorited, retweeted: !retweeted, user: user)
        
        var mutableTweets = items
        mutableTweets[index] = tweet
        
        return Timeline(items: mutableTweets)
    }
}