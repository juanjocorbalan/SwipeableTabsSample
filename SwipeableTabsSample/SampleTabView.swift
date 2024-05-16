//
//  SampleTabView.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct SampleTabView: View {
    let tab: Tab

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1...20, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(tab.color)
                        .frame(height: 100)
                }
            }
            .padding([.horizontal, .bottom])
        }
        .id(tab)
    }
}

#Preview {
    SampleTabView(tab: .audio)
}
