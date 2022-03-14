//
//  FileType.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

enum FileType {
    
    case directory
    case any(FileDetailsRepresentable)
    case media(MediaFileDetailsRepresentable)
}
