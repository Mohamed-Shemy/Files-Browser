//
//  UIViewController + Navigator.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation =
            navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func pop(with animation: Bool = true) {
        navigationController?.popViewController(animated: animation)
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool = true) {
        present(viewController, animated: animated, completion: nil)
    }
    
    func dismissAny(animated: Bool = true, dismissed: (() -> Void)? = nil) {
        if isModal {
            dismiss(animated: animated, completion: dismissed)
        } else {
            pop()
            dismissed?()
        }
    }
}

extension UIViewController
{
    @IBAction func dismissButtonDidTapped(_ sender: Any) {
        dismissAny()
    }
}

extension UIViewController {
    
    func present(navigatable: Navigatable, animated: Bool = true) {
        present(navigatable.viewController, animated: true, completion: nil)
    }
    
    func push(navigatable: Navigatable, animated: Bool = true) {
        navigationController?.pushViewController(navigatable.viewController, animated: animated)
    }
}
