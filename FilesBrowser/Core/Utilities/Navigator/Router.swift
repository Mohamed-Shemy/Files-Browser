//
//  Router.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

final class Router<Destination: Navigatable, Controller: UIViewController>: Navigator {
    
    weak var viewController: Controller?
    
    init(_ view: Controller?) {
        viewController = view
    }
}
