//
//  UIColor.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, opacity: Double = 1) {
        assert(0...255 ~= red, "Invalid red component")
        assert(0...255 ~= green, "Invalid green component")
        assert(0...255 ~= blue, "Invalid blue component")
        
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0, alpha: opacity)
    }
    
    convenience init(hexa: Int) {
        self.init(red: (hexa >> 16) & 0xFF,
                  green: (hexa >> 8) & 0xFF,
                  blue: hexa & 0xFF)
    }
}

extension UIColor {
    
    static let malibu = UIColor(hexa: 0x7ECEFA)
    static let wildWatermelon = UIColor(hexa: 0xFF526D)
}
