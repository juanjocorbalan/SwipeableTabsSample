//
//  SegmentedView.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct SegmentedView: View {
    let tabs: [Tab]
    let progress: CGFloat
    @Binding var selected: Tab?

    var body: some View {
        segmentsView()
            .foregroundStyle(.gray)
            .background(.tertiary.shadow(.inner(color: .primary, radius: 4, x: 4, y: 4)), in: .rect(cornerRadius: 12, style: .continuous))
        .overlay {
            segmentsView()
                .symbolVariant(.fill)
                .background(.gray)
                .mask {
                    GeometryReader { proxy in
                        let segmentWidth = proxy.size.width / CGFloat(tabs.count)
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .frame(width: segmentWidth)
                            .offset(x: progress * (proxy.size.width - segmentWidth))
                    }
                }
        }
    }

    @ViewBuilder
    private func segmentsView() -> some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.rawValue) { tab in
                Label(tab.rawValue.capitalized, systemImage: tab.image)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selected = tab
                        }
                    }
            }
        }
    }
}

#Preview {
    SegmentedView(tabs: Tab.allCases, progress: 0.5, selected: .constant(Tab.video))
}
