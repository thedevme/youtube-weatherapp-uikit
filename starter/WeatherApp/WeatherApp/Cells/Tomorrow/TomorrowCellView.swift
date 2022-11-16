//
//  TomorrowCellView.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/15/22.
//

import UIKit

class TomorrowCellView: UICollectionViewCell, SelfConfiguringCell {
    static let kind = String(describing: TomorrowCellView.self)
    static let reuseIdentifier = String(describing: TomorrowCellView.self)
    static let nib = UINib(nibName: String(describing: TomorrowCellView.self), bundle: nil)
    
    func configure(with item: Item) {}
}
