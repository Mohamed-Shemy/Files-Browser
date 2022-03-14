//
//  FilesRouter.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias FilesRouter = Router<FilesNavigatable, UIViewController>

extension FilesRouter {
    
    static func buildDirectory(with presenter: DirectoryContentPresenterProtocol) -> UIViewController {
        FilesNavigatable.directory(presenter).viewController
    }
}

enum FilesNavigatable: Navigatable {
    
    case directory(DirectoryContentPresenterProtocol)
    
    var viewController: UIViewController {
        switch self {
            case let .directory(presenter):
                let controller = DirectoryContentViewController(presenter: presenter)
                presenter.directoryContentView = controller
                return controller
        }
    }
}
