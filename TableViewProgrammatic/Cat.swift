//
//  Cat.swift
//  TableViewProgrammatic
//
//  Created by Leonardo  on 20/11/22.
//

import Foundation

// MARK: Model
struct Cat: Decodable {
    var breedName: String
    var origin: String
    var affectionLevel: Int
    var intelligence: Int
    var imageUrl: CatImage

    enum CodingKeys: String, CodingKey {
        case breedName = "name"
        case origin
        case affectionLevel = "affection_level"
        case intelligence
        case imageUrl = "image"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breedName = try container.decode(String.self, forKey: .breedName)
        self.origin = try container.decode(String.self, forKey: .origin)
        self.affectionLevel = try container.decode(Int.self, forKey: .affectionLevel)
        self.intelligence = try container.decode(Int.self, forKey: .intelligence)
        self.imageUrl = try container.decodeIfPresent(CatImage.self, forKey: .imageUrl) ?? CatImage()
    }

    init() {
        self.breedName = "Dummy Breed"
        self.origin = "Origin"
        self.affectionLevel = 1000
        self.intelligence = 1000
        self.imageUrl = CatImage()
    }

    static func getDummyCats() -> [Cat] {
        return Array(repeating: Cat(), count: 20)
    }
}

struct CatImage: Decodable {
    var url: String

    init() {
        self.url = "URL_ERROR"
    }
}
