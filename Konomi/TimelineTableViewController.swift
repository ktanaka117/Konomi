//
//  TimelineTableViewController.swift
//  FavLister
//
//  Created by 田中賢治 on 2015/12/27.
//  Copyright © 2015年 田中賢治. All rights reserved.
//

import UIKit
import AlamofireImage

class TimelineTableViewController: UITableViewController {
    
    let timelineDataSource = TimelineDataSource()
    let timelineDelegate = TimelineDelegate()
    let refresher = UIRefreshControl()
    
    override func viewDidLoad() {
        refresh()
        
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = timelineDataSource
        tableView.delegate = timelineDelegate
        
        refreshControl = refresher
        refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView.registerNib(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
    }
    
    func refresh() {
        refresher.beginRefreshing()
        
        TwitterManager.getTimeline() { [weak self] tweets in
            guard let `self` = self else { return }
            self.timelineDataSource.tweets = tweets
            self.tableView.reloadData()
            self.refresher.endRefreshing()
        }
    }
    
}
