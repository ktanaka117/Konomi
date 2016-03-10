//
//  User.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import SwiftyJSON

struct User {
    let id: String
    // @id
    let screenName: String
    let name: String
    let profileImageURL: String
    
    init(json: JSON) {
        self.id = json["id_str"].stringValue
        self.screenName = json["screen_name"].stringValue
        self.name = json["name"].stringValue
        self.profileImageURL = json["profile_image_url_https"].stringValue
    }
}
