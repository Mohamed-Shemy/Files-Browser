//
//  AudioPlayerPresenter.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Tue 15 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

final class AudioPlayerPresenter: AudioPlayerPresenterProtocol {
    
    // MARK: - Private Properties
    
    private var mediaFiles: [FileContentRepresentable]
    private var currentIndex: Int
    
    // MARK: - Public Properties
    
    weak var audioPlayerView: AudioPlayerViewProtocol?
    
    var currentFile: FileContentRepresentable? { mediaFiles[safe: currentIndex] }
    var hasNext: Bool { mediaFiles[safe: currentIndex + 1] != nil }
    var hasPrevious: Bool { mediaFiles[safe: currentIndex - 1] != nil }
    
    // MARK: - init
    
    init(mediaFiles: [FileContentRepresentable], current file: FileContentRepresentable?) {
        self.mediaFiles = mediaFiles
        self.currentIndex = mediaFiles.firstIndex(where: { $0.name == file?.name }) ?? 0
    }
    
    // MARK: - Public Methods
    
    func prepareToPlay() {
        presentCurrentMediaFile()
    }
    
    func getNext() {
        guard hasNext else { return }
        currentIndex += 1
        presentCurrentMediaFile()
    }
    
    func getPrevious() {
        guard hasPrevious else { return }
        currentIndex -= 1
        presentCurrentMediaFile()
    }
    
    // MARK: - Privete Methods & Helpers
    
    private func presentCurrentMediaFile() {
        guard let currentFile = currentFile else { return }
        audioPlayerView?.audioPlayerView(didRecive: currentFile)
    }
}
