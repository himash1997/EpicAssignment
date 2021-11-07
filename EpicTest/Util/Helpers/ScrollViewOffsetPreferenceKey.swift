//
//  ScrollViewOffsetPreferenceKey.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-06.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
