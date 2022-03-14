//
//  UITableView.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(nib cell: Cell.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func register<Cell: UITableViewCell>(class cell: Cell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    func register<View: UITableViewHeaderFooterView>(class headerFooter: View.Type) {
        register(headerFooter, forHeaderFooterViewReuseIdentifier: headerFooter.identifier)
    }
    
    func register<View: UITableViewHeaderFooterView>(nib headerFooter: View.Type) {
        register(headerFooter.nib, forHeaderFooterViewReuseIdentifier: headerFooter.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let id = Cell.identifier
        guard let cell = dequeueReusableCell(withIdentifier: id) as? Cell
        else { fatalError("Cannot dequeue cell with identifier '\(id)'") }
        return cell
    }
    
    func dequeue<HeaderFooter: UITableViewHeaderFooterView>() -> HeaderFooter {
        let id = HeaderFooter.identifier
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: id) as? HeaderFooter
        else { fatalError("Cannot dequeue header/footer with identifier '\(id)'") }
        return view
    }
}
