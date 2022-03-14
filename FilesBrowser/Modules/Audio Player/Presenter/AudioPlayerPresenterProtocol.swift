//
//  AudioPlayerPresenterProtocol.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Tue 15 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol AudioPlayerPresenterProtocol: AnyObject {
    
    var audioPlayerView: AudioPlayerViewProtocol? { get set }
    var currentFile: FileContentRepresentable? { get }
    var hasNext: Bool { get }
    var hasPrevious: Bool { get }
    
    func prepareToPlay()
    func getNext()
    func getPrevious()
}
