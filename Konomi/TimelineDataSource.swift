//
//  TimelineDataSource.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/03/10.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class TimelineDataSource: NSObject, UITableViewDataSource {
    
    var timeline: Timeline = Timeline(items: [])
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline.numberOfItems
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("TimelineTableViewCell") as? TimelineTableViewCell else { fatalError("Cell couldn't be created.") }
        
        let retweetView = UIView()
        let favoriteView = UIView()
        
        let greenColor = UIColor.greenColor()
        let redColor = UIColor.redColor()
        
        cell.setSwipeGestureWithView(retweetView, color: greenColor, mode: .Switch, state: .State1, completionBlock: { _, _, _ in })
        cell.setSwipeGestureWithView(favoriteView, color: redColor, mode: .Switch, state: .State3, completionBlock: { _, _, _ in })
        
        cell.screenNameLabel.text = "@\(timeline[indexPath.row].user.screenName)"
        cell.nameLabel.text = timeline[indexPath.row].user.name
        cell.descriptionLabel.text = timeline[indexPath.row].text
        cell.iconImageView.af_setImageWithURL(NSURL(string: timeline[indexPath.row].user.profileImageURL)!)
        
        return cell
    }
    
}