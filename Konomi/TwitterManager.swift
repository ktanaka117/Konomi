//
//  TwitterManager.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct TwitterManager {
    
    // MARK: - Timeline
    static func getTimeline(completionHandler: (tweets: [Tweet]) -> ()) {
        getTimelineJSON() { json in
            var tweets: [Tweet] = []
            
            for data in json.array! {
                let user = User(json: data["user"])
                let tweet = Tweet(json: data, user: user)
                tweets.append(tweet)
                
                print("")
                print(tweet)
                print("")
            }
            
            completionHandler(tweets: tweets)
        }
    }
    
    // MARK: - Private
    private static func getTimelineJSON(completionHandler: (json: JSON) -> ()) {
        let request = Alamofire.request(Router.GetTimeline)
        request.responseJSON { response in
            if response.result.isFailure {
                print("getTimeline is failed.")
                return
            }
            
            guard let json = response.result.value else { return }
            
            completionHandler(json: JSON(json))
        }
    }
}
