//
//  CustomProgressViewStyle.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-07.
//

import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .foregroundColor(.white)
    }
}
