//
//  ContentView.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .audio

    var body: some View {
        VStack(spacing: 20) {
            Text("Multimedia")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            SegmentedView(tabs: Tab.allCases, selected: $selectedTab)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView()
}
