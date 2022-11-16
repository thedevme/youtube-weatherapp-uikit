//
//  DailyCellView.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/15/22.
//

import UIKit

class DailyCellView: UICollectionViewCell, SelfConfiguringCell {
    static let kind = String(describing: DailyCellView.self)
    static let reuseIdentifier = String(describing: DailyCellView.self)
    static let nib = UINib(nibName: String(describing: DailyCellView.self), bundle: nil)
    
    func configure(with item: Item) {}
}
