//
//  Fonts+Extenstion.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-05.
//

import Foundation
import SwiftUI

enum AppFonts: String {
    case OswaldSemiBold = "Oswald-SemiBold"
    case OswaldRegular = "Oswald-Regular"
    case OswaldMedium = "Oswald-Medium"
    case OswaldLight = "Oswald-Light"
    case OswaldExtraLight = "Oswald-ExtraLight"
    case OswaldBold = "Oswald-Bold"
}

extension Font {
    static func custom(_ name: AppFonts, _ size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}
