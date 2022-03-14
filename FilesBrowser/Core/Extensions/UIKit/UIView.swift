//
//  UIView.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIView {
    
    static var identifier: String { "\(Self.self)" }
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }
}
