//
//  FileType + FileAppearanceRepresentable.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension FileType: FileAppearanceRepresentable {
    
    var defaultSystemIconName: String {
        switch self {
            case .directory: return "folder.fill"
            case .any: return "doc.fill"
            case .media(let mediaFile): return mediaFile.extension.defaultSystemIconName
        }
    }
    
    var iconTinitColor: UIColor {
        switch self {
            case .directory:
                return .malibu
            case .any(let file):
                return file.extension.iconTinitColor
            case .media(let mediaFile):
                return mediaFile.extension.iconTinitColor
        }
    }
}
