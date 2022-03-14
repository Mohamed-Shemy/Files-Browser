//
//  DirectoryContentViewController.swift
//  PlayerReader
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

class DirectoryContentViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let presenter: DirectoryContentPresenterProtocol
    private lazy var router = FilesRouter(self)
    
    // MARK: - init
    
    init(presenter: DirectoryContentPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("use init(presenter: <#T##DirectoryContentPresenterProtocol#>)")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadMP3Files()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupTitle()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(nib: FileTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupTitle() {
        title = presenter.directory.name
    }
    
    // MARK: - Private Methods
    
    private func loadMP3Files() {
        presenter.loadContent(ofType: .mp3)
    }
}

// MARK: - DirectoryContentViewProtocol

extension DirectoryContentViewController: DirectoryContentViewProtocol {
    
    func directoryContentDidLoaded() {
        tableView.reloadData()
    }
    
    func directoryContentView(didRecive errorMessage: String) {
        let alert = UIAlertController(title: "Something Wrong!", message: errorMessage, preferredStyle: .alert)
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension DirectoryContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FileTableViewCell = tableView.dequeue()
        if let item = presenter.item(at: indexPath.row) {
            cell.configure(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let file = presenter.item(at: indexPath.row) else { return }
        switch file.type {
            case .directory:
                let directoryContentPresenter = DirectoryContentPresenter(directory: file)
                router.navigate(to: .directory(directoryContentPresenter))
                
            case .media:
                // present AudioPlayerViewController
                break
                
            default: break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 70 }
}
