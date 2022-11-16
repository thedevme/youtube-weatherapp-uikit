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
    
    @IBOutlet weak var lblFirstTitle: UILabel!
    @IBOutlet weak var lblFirstSubtitle: UILabel!
    @IBOutlet weak var lblSecondTitle: UILabel!
    @IBOutlet weak var lblSecondSubtitle: UILabel!
    @IBOutlet weak var lblThirdTitle: UILabel!
    @IBOutlet weak var lblThirdSubtitle: UILabel!
    @IBOutlet weak var lblFourthTitle: UILabel!
    @IBOutlet weak var lblFourthSubtitle: UILabel!
    
    @IBOutlet weak var imgGrid: UIImageView!
    
    func configure(with item: Item) {
        imgGrid.tintColor = item.dividerColor
        
        lblFirstTitle.textColor = item.titleColor
        lblSecondTitle.textColor = item.titleColor
        lblThirdTitle.textColor = item.titleColor
        lblFourthTitle.textColor = item.titleColor
        
        lblFirstSubtitle.textColor = item.subtitleColor
        lblSecondSubtitle.textColor = item.subtitleColor
        lblThirdSubtitle.textColor = item.subtitleColor
        lblFourthSubtitle.textColor = item.subtitleColor
    }
}
