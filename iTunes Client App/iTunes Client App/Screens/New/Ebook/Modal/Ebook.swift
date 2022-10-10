//
//  Ebook.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 8.10.2022.
//

import Foundation

struct Ebook: Decodable {
    let collectionId: Int?
    let artistName: String?
    let collectionName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let genre: String?
    let description: String?
    let country: String?

    
    
    enum CodingKeys: String, CodingKey {
        case collectionId
        case artistName
        case collectionName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case genre = "primaryGenreName"
        case description
        case country
        
    }
}
