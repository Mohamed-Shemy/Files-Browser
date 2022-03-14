//
//  FileAppearanceRepresentable.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

protocol FileAppearanceRepresentable {
    
    var defaultSystemIconName: String { get }
    var iconTinitColor: UIColor { get }
}
