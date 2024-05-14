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
                    RoundedRectangle(cornerRadius: 16)
                        .fill(tab.color)
                        .opacity(0.5)
                        .frame(height: 100)
                }
            }
            .padding(.horizontal)
        }
        .containerRelativeFrame(.horizontal)
        .id(tab)
    }
}

#Preview {
    SampleTabView(tab: .audio)
}
