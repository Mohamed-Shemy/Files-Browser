//
//  AudioPlayerViewProtocol.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Tue 15 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

protocol AudioPlayerViewProtocol: AnyObject {
    
    func audioPlayerView(didRecive mediaFile: FileContentRepresentable)
}
