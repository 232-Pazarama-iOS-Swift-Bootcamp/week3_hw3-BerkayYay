//
//  Software.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 8.10.2022.
//

import Foundation


struct Software: Decodable {
    let collectionId: Int?
    let collectionName: String?
    let artistName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let genre: String?
    let collectionPrice: Double?
    let country: String?
    
    
    enum CodingKeys: String, CodingKey {
        case collectionId
        case artistName
        case collectionName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case genre = "primaryGenreName"
        case collectionPrice
        case country
        
    }
}
