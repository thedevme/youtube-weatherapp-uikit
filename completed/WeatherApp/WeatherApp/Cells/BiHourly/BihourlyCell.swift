//
//  BihourlyCell.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/10/22.
//

import UIKit

class BihourlyCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier = String(describing: BihourlyCell.self)
    static let nib = UINib(nibName: String(describing: BihourlyCell.self), bundle: nil)
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var leadingContraint: NSLayoutConstraint!
    
    func configure(with item: Item) {
        if item.index == 0 {
            background.clipsToBounds = true
            background.layer.cornerRadius = 40
            background.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMinXMaxYCorner]
            leadingContraint.constant = 30
        } else {
            background.clipsToBounds = true
            background.layer.cornerRadius = 0
            background.layer.maskedCorners = []
            leadingContraint.constant = 15
        }
    }
}
