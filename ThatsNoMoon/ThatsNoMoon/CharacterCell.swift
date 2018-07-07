//
//  Actor.swift
//  ThatsNoMoon
//
//  Created by Chung, Myungyun on 7/7/18.
//  Copyright © 2018 Chung, Myungyun. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

