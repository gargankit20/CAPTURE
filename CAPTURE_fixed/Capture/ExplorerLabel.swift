//
//  ExplorerLabel.swift
//  Capture
//
//  Created by Mathias Palm on 2016-08-29.
//  Copyright © 2016 capture. All rights reserved.
//

import UIKit

protocol ViewAllPostDelegate {
    func goViewAll()
}

class ExplorerLabel: UICollectionViewCell {
    
    @IBOutlet weak var btn_VewAll: UIButton!
    @IBOutlet weak var label: UILabel!
    var delegate : ViewAllPostDelegate? = nil

    var string: String? {
        didSet {
            label.text = string
        }
    }
    
    @IBAction func ViewAllButtonClicked() {
        
        delegate?.goViewAll()
    }

}
