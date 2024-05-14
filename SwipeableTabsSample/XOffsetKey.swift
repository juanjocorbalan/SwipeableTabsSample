//
//  View+Extensions.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct XOffsetKey: PreferenceKey {

    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
