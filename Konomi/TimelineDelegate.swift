//
//  TimelineTableViewDelegate.swift
//  Konomi
//
//  Created by 田中賢治 on 2016/03/10.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit
import MCSwipeTableViewCell

class TimelineDelegate: NSObject, UITableViewDelegate {
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
