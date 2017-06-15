//
//  AllPostVideoCell.swift
//  Capture
//
//  Created by Gustav on 5/3/17.
//  Copyright © 2017 capture. All rights reserved.
//

import UIKit

class AllPostVideoCell: UICollectionViewCell {
    @IBOutlet weak var videoImageView: ImageView!
    @IBOutlet weak var playImage: UIImageView!
    
    var postID:Int?
    var thumb:String? {
        didSet {
            if let thumb = thumb {
                if thumb.characters.count > 0 {
                    videoImageView.alpha = 1
                    playImage.alpha = 1
                    videoImageView.loadImage(thumb)
                }
            }
        }
    }
}
