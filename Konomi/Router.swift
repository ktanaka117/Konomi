//
//  Router.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/02/09.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import Alamofire
import Social

enum Router: URLRequestConvertible {
    
    case GetTimeline
    
    private var Method: SLRequestMethod {
        switch self {
        case .GetTimeline:
            return .GET
        }
    }
    
    private var URLString: String {
        return "https://api.twitter.com/1.1/"
    }
    
    private var EndPoint: String {
        switch self {
        case .GetTimeline:
            return "statuses/home_timeline.json"
        }
    }
    
    private var Parameters: [String: AnyObject] {
        switch self {
        case .GetTimeline:
            return [:]
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: Method, URL: NSURL(string: URLString + EndPoint), parameters: Parameters)
        request.account = Account.twitterAccount
        
        return request.preparedURLRequest() as! NSMutableURLRequest
    }
}
