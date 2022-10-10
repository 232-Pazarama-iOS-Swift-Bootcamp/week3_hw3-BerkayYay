//
//  EbookResponse.swift
//  iTunes Client App
//
//  Created by Berkay YAY on 8.10.2022.
//

import Foundation

struct EbookResponse: Decodable {
    let resultCount: Int?
    let results: [Ebook]?
}
