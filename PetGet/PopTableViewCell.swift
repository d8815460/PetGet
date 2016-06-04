//
//  PopTableViewCell.swift
//  PetGet
//
//  Created by 駿逸 陳 on 2016/6/4.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import Canvas

class PopTableViewCell: UITableViewCell {

    @IBOutlet weak var isSelectView: UIView!
    @IBOutlet weak var categoryView: CSAnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var isLovedButton: UIButton!
    @IBOutlet weak var isSelectedLabel: UILabel!
    weak var petGetObject: PFObject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func iLoveThisPet(sender: AnyObject) {
        
    }
}
