//
//  Collection.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

extension Collection {
    
    var isNotEmpty: Bool { !isEmpty }
    
    subscript(safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}

extension Collection {
    
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>, _ condition: (T, T) throws -> Bool) rethrows -> [Element] {
        try sorted { try condition($0[keyPath: keyPath], $1[keyPath: keyPath]) }
    }
    
    func filter<T>(where keyPath: KeyPath<Element, T>, _ condition: (T?, T?) throws -> Bool, _ element: T?) rethrows -> [Element] {
        try filter { try condition($0[keyPath: keyPath], element) }
    }
    
    func filter(where keyPath: KeyPath<Element, Bool>) -> [Element] {
        filter({ $0[keyPath: keyPath] })
    }
    
    func filter(whereNot keyPath: KeyPath<Element, Bool>) -> [Element] {
        filter({ !$0[keyPath: keyPath] })
    }
}
