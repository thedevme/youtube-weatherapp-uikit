//
//  WeatherInfoCellView.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/15/22.
//

import UIKit

class WeatherInfoCellView: UICollectionViewCell, SelfConfiguringCell {
    static let kind = String(describing: WeatherInfoCellView.self)
    static let reuseIdentifier = String(describing: WeatherInfoCellView.self)
    static let nib = UINib(nibName: String(describing: WeatherInfoCellView.self), bundle: nil)
    
    func configure(with item: Item) {}
}
