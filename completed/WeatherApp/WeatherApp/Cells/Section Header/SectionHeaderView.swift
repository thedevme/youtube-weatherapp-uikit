//
//  SectionHeaderView.swift
//  StarterApp
//
//  Created by Craig Clayton on 11/15/22.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    static let kind = String(describing: SectionHeaderView.self)
    static let reuseIdentifier = String(describing: SectionHeaderView.self)
    static let nib = UINib(nibName: String(describing: SectionHeaderView.self), bundle: nil)
    
    @IBOutlet weak var lblTitle: UILabel!
    
    func configure(_ title:String) {
        if lblTitle != nil {
            lblTitle.text = title
        }
    }
}
