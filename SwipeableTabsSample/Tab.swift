//
//  Tab.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import SwiftUI

enum Tab: Int, CaseIterable {
    case audio
    case video
    case photo

    var title: String {
        switch self {
        case .audio:
            return "Audio"
        case .video:
            return "Video"
        case .photo:
            return "Photo"
        }
    }

    var image: String {
        switch self {
        case .audio:
            return "speaker"
        case .video:
            return "video"
        case .photo:
            return "photo"
        }
    }

    var color: Color {
        switch self {
        case .audio:
            return .mint
        case .video:
            return .pink
        case .photo:
            return .indigo
        }
    }
}
