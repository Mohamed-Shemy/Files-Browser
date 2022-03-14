//
//  DirectoryContentPresenter.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

final class DirectoryContentPresenter: DirectoryContentPresenterProtocol {
    
    // MARK: - Public Properties
    
    weak var directoryContentView: DirectoryContentViewProtocol?
    private(set) var items: [FileContentRepresentable] = []
    var numberOfItems: Int { items.count }
    let directory: FileRepresentable
    
    // MARK: - Private Properties
    
    private let manager: FilesManaging
    
    // MARK: - init
    
    init(directory: FileRepresentable, manager: FilesManaging = FilesManager()) {
        self.directory = directory
        self.manager = manager
    }
    
    // MARK: - Public Methods
    
    func loadContent(ofType ext: FileExtension?) {
        let result = manager.getContents(in: directory.path, ofType: ext)
        switch result {
            case .success(let content):
                items = content
                directoryContentView?.directoryContentDidLoaded()
                
            case .failure(let error):
                directoryContentView?.directoryContentView(didRecive: error.localizedDescription)
        }
    }
    
    func item(at index: Int) -> FileContentRepresentable? {
        items[safe: index]
    }
    
    func getMediaFiles() -> [FileContentRepresentable] {
        items.filter { if case .media = $0.type { return true }; return false }
    }
}
