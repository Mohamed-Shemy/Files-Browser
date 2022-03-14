//
//  RootRouter.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Tue 15 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

typealias RootRouter = Router<RootNavigator, UINavigationController>

enum RootNavigator: Navigatable {
    
    case directory(DirectoryContentPresenterProtocol)
    
    var viewController: UIViewController {
        switch self {
            case .directory(let directoryContentPresenter):
                return FilesRouter.buildDirectory(with: directoryContentPresenter)
        }
    }
}
