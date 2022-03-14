//
//  TimeRepresentable.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol TimeRepresentable: CustomStringConvertible {
    
    var hour: Int { get set }
    var minute: Int { get set }
    var second: Int { get set }
    
    init(_ floatTime: Double, roundSeconds: Bool)
    init(hour: Int, minute: Int, second: Int)
    init(_ date: Date)
    init()
}
