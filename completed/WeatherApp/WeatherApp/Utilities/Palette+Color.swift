//
//  Palette+Color.swift
//  WeatherAppDesign
//
//  Created by Craig Clayton on 11/4/22.
//

import SwiftUI

extension UIColor {
    static let baseBlue = Color("baseBlue")
    static let baseDarkBlue = Color("baseDarkBlue")
    static let baseLightBlue = Color("baseLightBlue")
    static let baseLightGrey = Color("baseLightGrey")
    static let baseOffWhite = Color("baseOffWhite")

    private static func Color(_ key: String) -> UIColor {
       if let color = UIColor(named: key, in: .main, compatibleWith: nil) {
           return color
       }

       return .black
    }
}
