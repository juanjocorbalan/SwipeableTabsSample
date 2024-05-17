//
//  ContentView.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab? = .audio
    @State private var selectedProgress: CGFloat = 0

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20) {
                Text("Multimedia")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                SegmentedView(tabs: Tab.allCases, progress: selectedProgress, selected: $selectedTab)
                    .padding(.horizontal)

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            SampleTabView(tab: tab)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .overlay {
                        GeometryReader { p in
                            Color.clear
                                .preference(key: XOffsetKey.self, value: p.frame(in: .scrollView(axis: .horizontal)).minX)
                                .onPreferenceChange(XOffsetKey.self) { currentOffset in
                                    let segmentWidth = p.size.width / CGFloat(Tab.allCases.count)
                                    let progress = -currentOffset / (p.size.width - segmentWidth)
                                    selectedProgress = max(min(progress, 1), 0)
                                }
                        }
                    }
                    .safeAreaPadding(.bottom, proxy.safeAreaInsets.bottom)
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $selectedTab)
                .scrollIndicators(.hidden, axes: .horizontal)
                .scrollTargetBehavior(.viewAligned)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    ContentView()
}
