//
//  MusicResponse.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 7.10.2022.
//

import Foundation


struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}
