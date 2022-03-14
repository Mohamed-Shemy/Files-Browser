//
//  FileTableViewCell.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var fileImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Public Methods

    func configure(with item: FileContentRepresentable) {
        titleLabel.text = item.description
        setAppearance(for: item.type)
        setDescription(for: item.type)
    }
    
    // MARK: - Private Methods
    
    private func setAppearance(for appearance: FileAppearanceRepresentable) {
        fileImageView.image = UIImage(systemName: appearance.defaultSystemIconName)
        fileImageView.tintColor = appearance.iconTinitColor
    }
    
    private func setDescription(for fileType: FileType) {
        switch fileType {
            case .media(let mediaFile):
                descriptionLabel.text = "\(mediaFile.duration)"
            default:
                descriptionLabel.text = ""
        }
    }
}
