//
//  AppCoordinator.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

final class AppCoordinator {

    // MARK: - Properties
    
    private var window: UIWindow
    private var router: RootRouter
    private var navigationController = UINavigationController()
    
    // MARK: - init
    
    init(_ window: UIWindow? = nil) {
        self.window = window ?? UIWindow(frame: UIScreen.main.bounds)
        router = .init(navigationController)
        setNavigationControllerStyle()
        setRoot(navigationController)
    }
    
    // MARK: - Methods
    
    private func setNavigationControllerStyle() {
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func launchFirstScreen() {
        let downloadDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let directory = File(name: downloadDirectoryURL.lastPathComponent, path: downloadDirectoryURL.path)
        let presenter = DirectoryContentPresenter(directory: directory)
        router.navigate(to: .directory(presenter))
    }
    
    func setRoot(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
