//
//  View+Extensions.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

extension View {

    @ViewBuilder
    func maskSegment(index: Int, in total: Int) -> some View {
        @Environment(\.colorScheme) var scheme

        ZStack {
            self
                .foregroundStyle(.gray)
            self
                .symbolVariant(.fill)
                .background(.gray)
                .mask {
                    GeometryReader { proxy in
                        let itemWidth = proxy.size.width / CGFloat(total)
                        Capsule()
                            .frame(width: itemWidth)
                            .offset(x: CGFloat(index) * itemWidth)
                    }
                }
        }
    }
}
