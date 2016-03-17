//
//  TimelineTableViewCell.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/03/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit
import MCSwipeTableViewCell

class TimelineTableViewCell: MCSwipeTableViewCell, MCSwipeTableViewCellDelegate {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var position: CGPoint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // タップ時にcontentViewの中のviewの座標を取らないようにする
        let view = UIView(frame: frame)
        view.tag = 10000
        addSubview(view)
        
        delegate = self
    }
    
    func swipeTableViewCellDidEndSwiping(cell: MCSwipeTableViewCell!) {
        print("swipeTableViewCellDidEndSwiping")
    }
    
}
