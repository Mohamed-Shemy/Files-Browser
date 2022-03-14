//
//  MediaFileDetails.swift
//  FilesBrowser
//
//  Created by Mohamed Shemy on Mon 14 Mar, 2022.
//  Copyright © 2022 Mohamed Shemy. All rights reserved.
//

import Foundation

struct MediaFileDetails: MediaFileDetailsRepresentable {
    
    let duration: TimeRepresentable
    let `extension`: FileExtension
}
