//
//  Movie.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 8.10.2022.
//

import Foundation

struct Movie: Decodable {
    let collectionId: Int?
    let collectionName: String?
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let trackPrice: Double?
    let releaseDate: String?
    let genre: String?
    let country: String?
    
    
    enum CodingKeys: String, CodingKey {
        case collectionId
        case collectionName
        case artistName
        case trackName
        case artworkLarge = "artworkUrl100"
        case trackPrice
        case releaseDate
        case genre = "primaryGenreName"
        case country
        
    }
}
