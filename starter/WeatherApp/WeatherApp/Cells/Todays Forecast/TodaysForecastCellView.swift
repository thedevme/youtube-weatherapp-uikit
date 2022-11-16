//
//  TodaysForecastCellView.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/8/22.
//

import UIKit

class TodaysForecastCellView: UICollectionViewCell, SelfConfiguringCell {
    static let kind = String(describing: TodaysForecastCellView.self)
    static let reuseIdentifier = String(describing: TodaysForecastCellView.self)
    static let nib = UINib(nibName: String(describing: TodaysForecastCellView.self), bundle: nil)
    
    func configure(with item: Item) {}
}
