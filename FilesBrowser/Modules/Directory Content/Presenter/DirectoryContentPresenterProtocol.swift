//
//  DirectoryContentPresenterProtocol.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol DirectoryContentPresenterProtocol: AnyObject {
    
    var directoryContentView: DirectoryContentViewProtocol? { get set }
    var directory: FileRepresentable { get }
    var numberOfItems: Int { get }
    
    func loadContent(ofType ext: FileExtension?)
    func item(at index: Int) -> FileContentRepresentable?
    func getMediaFiles() -> [FileContentRepresentable]
}
