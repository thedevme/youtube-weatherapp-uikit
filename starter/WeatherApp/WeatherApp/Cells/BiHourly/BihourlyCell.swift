//
//  BihourlyCell.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/10/22.
//

import UIKit

class BihourlyCell: UICollectionViewCell, SelfConfiguringCell {
    static let kind = String(describing: BihourlyCell.self)
    static let reuseIdentifier = String(describing: BihourlyCell.self)
    static let nib = UINib(nibName: String(describing: BihourlyCell.self), bundle: nil)
    
    func configure(with item: Item) {}
}
