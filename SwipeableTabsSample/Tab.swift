//
//  Tab.swift
//  SwipeableTabsSample
//
//  Created by Juanjo Corbalan on 14/5/24.
//

import Foundation

enum Tab: String, CaseIterable {
    case audio
    case video
    case photo

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
}
