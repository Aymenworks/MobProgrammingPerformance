//
//  TextCollectionViewCell.swift
//  check-cpu-gpu
//
//  Created by Rebouh Aymen on 07/02/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        layer.cornerRadius = 4

        for subview in contentView.subviews {
            if let button =  subview as? UIButton {
                button.layer.cornerRadius = 4
                button.layer.shadowColor = UIColor.red.cgColor
                button.layer.shadowRadius = 4
                button.layer.shadowOpacity = 0.5
                button.layer.shadowOffset =  .init(width: 4, height: 4)
                button.clipsToBounds = false
                button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
            }
        }
    }
}
