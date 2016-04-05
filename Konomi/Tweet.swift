//
//  Tweet.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

struct Tweet {
    let id: String
    let text: String
    let favorited: Bool
    let retweeted: Bool
    let user: User
    
    init(json: JSON, user: User) {
        self.id = json["id_str"].stringValue
        self.text = json["text"].stringValue
        self.favorited = json["favorited"].boolValue
        self.retweeted = json["retweetes"].boolValue
        self.user = user
    }
    
    init(id: String, text: String, favorited: Bool, retweeted: Bool, user: User) {
        self.id = id
        self.text = text
        self.favorited = favorited
        self.retweeted = retweeted
        self.user = user
    }
}
