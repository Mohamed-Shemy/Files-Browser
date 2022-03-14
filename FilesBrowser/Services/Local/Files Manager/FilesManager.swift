//
//  FilesManager.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation
import AVFoundation

final class FilesManager: FilesManaging {
    
    // MARK: - Properties
    
    private let manager: FileManaging
    
    // MARK: - init
    
    init(managere: FileManaging = FileManager.default) {
        self.manager = managere
    }
    
    // MARK: - Public Methods
    
    func getContents(in directoryPath: String, ofType filterExtension: FileExtension?) -> Result<[FileContentRepresentable], Error> {
        do {
            let content = try manager.contentsOfDirectory(atPath: directoryPath).map{
                URL(fileURLWithPath: directoryPath).appendingPathComponent($0)
            }
            
            var items: [FileContentRepresentable] = []
            for itemURL in content {
                let type: FileType
                if itemURL.pathExtension.isEmpty {
                    type = .directory
                } else {
                    guard let ext = FileExtension(rawValue: itemURL.pathExtension) else { continue }
                    if let filterExtension = filterExtension, filterExtension != ext { continue }
                    type = getFileType(for: itemURL, of: ext)
                }
                
                let urlWithoutExtension = itemURL.deletingPathExtension()
                let file = FileContent(name: urlWithoutExtension.lastPathComponent, path: itemURL.path, type: type)
                items.append(file)
            }
            
            return .success(items)
        } catch let error {
            return .failure(error)
        }
    }
    
    // MARK: - Private Methods & Helpers
    
    private func getFileType(for fileURL: URL, of ext: FileExtension) -> FileType {
        if ext.isMedia {
            let fileDetails = createMediaFileDetails(for: fileURL, of: ext)
            return .media(fileDetails)
        } else {
            return .any(FileDetails(extension: ext))
        }
    }
    
    private func createMediaFileDetails(for fileURL: URL, of ext: FileExtension) -> MediaFileDetailsRepresentable {
        let duration = getDurationFor(media: fileURL)
        return MediaFileDetails(duration: duration, extension: ext)
    }
    
    private func getDurationFor(media fileURL: URL) -> TimeRepresentable {
        let audioAsset = AVAsset(url: fileURL)
        let duration = CMTimeGetSeconds(audioAsset.duration) / 3600
        return Time(duration)
    }
}
