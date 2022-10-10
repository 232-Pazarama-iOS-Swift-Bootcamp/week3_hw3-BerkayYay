//
//  Music.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 7.10.2022.
//

import Foundation

struct Music: Decodable {
    let collectionId: Int?
    let collectionName: String?
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let trackPrice: Double?
    let genre: String?
    let currency: String?
    
    enum CodingKeys: String, CodingKey {
        case collectionId
        case collectionName 
        case artistName
        case trackName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
        case trackPrice
        case genre = "primaryGenreName"
        case currency
    }
}
