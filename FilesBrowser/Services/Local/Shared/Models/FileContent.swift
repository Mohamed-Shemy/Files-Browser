//
//  FileContent.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

struct FileContent: FileContentRepresentable {
    
    let name: String
    let path: String
    let type: FileType
    
    var description: String {
        let ext: String
        switch type {
            case .any(let file):
                ext = file.extension.rawValue
            case .media(let mediaFile):
                ext = mediaFile.extension.rawValue
            default: ext = ""
        }
        if ext.isEmpty {
            return name
        }
        return "\(name).\(ext)"
    }
}
