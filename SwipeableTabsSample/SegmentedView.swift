//
//  SegmentedView.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct SegmentedView: View {
    let tabs: [Tab]
    @Binding var selected: Tab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.rawValue) { tab in
                Label(tab.title, systemImage: tab.image)
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
        .maskSegment(index: selected.rawValue, in: tabs.count)
        .foregroundStyle(.white)
        .background(.quaternary.shadow(.inner(color: .primary, radius: 4, x: 4, y: 4)), in: .capsule)
    }
}

#Preview {
    SegmentedView(tabs: Tab.allCases, selected: .constant(Tab.video))
}
