//
//  FileExtension + FileAppearanceRepresentable.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension FileExtension: FileAppearanceRepresentable {
    
    var defaultSystemIconName: String {
        switch self {
            case .mp3:
                return "music.quarternote.3"
        }
    }
    
    var iconTinitColor: UIColor {
        switch self {
            case .mp3:
                return .wildWatermelon
        }
    }
}
