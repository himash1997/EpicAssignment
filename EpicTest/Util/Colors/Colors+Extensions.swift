//
//  Colors+Extensions.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-05.
//

import Foundation
import SwiftUI

enum AppColors: String{
    
    //MARK: Cast view colors
    case HEX_1D2033 = "#1D2033" //Background
    case HEX_252A3D = "#252A3D" //TabBar
    case HEX_F0E3CE = "#F0E3CE" //Title
    case HEX_6E717B = "#6E717B" //paging
    
    //MARK: Cast Cells colors
    case HEX_483231 = "#483231" //Name
    case HEX_A5897F = "#A5897F" //Occuoations
    case HEX_D6D7D9 = "#D6D7D9" //Dummy Text
    case HEX_EF9E78 = "#EF9E78" //Follow btn
    case HEX_EBEBEB = "#EBEBEB" //card background
}

extension Color {
    static func custom(_ name: AppColors) -> Color {
        return Color(name.rawValue)
    }
}
