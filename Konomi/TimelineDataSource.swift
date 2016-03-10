//
//  TimelineDataSource.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/03/10.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class TimelineDataSource: NSObject, UITableViewDataSource {
    
    var tweets: [Tweet] = []
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("TimelineTableViewCell") as? TimelineTableViewCell else { fatalError("Cell couldn't be created.") }
        
        cell.screenNameLabel.text = "@\(tweets[indexPath.row].user.screenName)"
        cell.nameLabel.text = tweets[indexPath.row].user.name
        cell.descriptionLabel.text = tweets[indexPath.row].text
        cell.iconImageView.af_setImageWithURL(NSURL(string: tweets[indexPath.row].user.profileImageURL)!)
        
        cell.tag = indexPath.row
        
        return cell
    }
    
}