//
//  FileExtension.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

enum FileExtension: String {
    
    case mp3
}

extension FileExtension {
    
    static let mediaExtensions: [Self] = [.mp3]
    
    var isMedia: Bool { Self.mediaExtensions.contains(self) }
}
