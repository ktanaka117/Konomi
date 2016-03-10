//
//  TimelineTableViewCell.swift
//  FavLister
//
//  Created by 田中賢治 on 2016/03/01.
//  Copyright © 2016年 田中賢治. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
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
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        position = touches.first?.locationInView(viewWithTag(10000))
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesMoved(touches, withEvent: event)
        
        let movedX = touches.first?.locationInView(self).x
        frame.origin.x -= position!.x - movedX!
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        frame.origin.x = 0
    }
}
