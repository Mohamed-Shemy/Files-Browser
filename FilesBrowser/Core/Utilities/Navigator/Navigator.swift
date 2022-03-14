//
//  Navigator.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

protocol Navigator: AnyObject {
    
    associatedtype Destination: Navigatable
    associatedtype Controller: UIViewController
    
    var viewController: Controller? { get }
    
    func dismiss()
    func navigate(to destination: Destination)
    func present(_ controller: Destination)
}

extension Navigator {
    
    func dismiss() {
        viewController?.dismissAny()
    }
    
    func navigate(to destination: Destination) {
        viewController?.push(navigatable: destination)
    }
    
    func present(_ controller: Destination) {
        viewController?.present(navigatable: controller)
    }
}

extension Navigator where Controller == UINavigationController {
    
    func navigate(to destination: Destination) {
        guard viewController?.navigationController != nil else {
            viewController?.pushViewController(destination.viewController, animated: true)
            return
        }
        
        viewController?.push(navigatable: destination)
    }
}
