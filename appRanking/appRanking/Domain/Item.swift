import UIKit

struct Item {
    var id: String
    var genres: [String]
    var rank: Int
    var name: String
    var imageUrl: String
    var images: [String]
    var summary: String
    var description: String
    var price: Int
    var category: String
    var artist: String
    var date: String
    
    init(
        id: String = "",
        genres: [String] = [],
        rank: Int = 0,
        name: String = "",
        imageUrl: String = "",
        images: [String] = [],
        summary: String = "",
        description: String = "",
        price: Int = 0,
        category: String = "",
        artist: String = "",
        date: String = ""
        ) {
        self.id = id
        self.genres = genres
        self.rank = rank
        self.name = name
        self.imageUrl = imageUrl
        self.images = images
        self.summary = summary
        self.description = description
        self.price = price
        self.category = category
        self.artist = artist
        self.date = date
    }
    
    var isPersonal: Bool {
        let keywords = ["inc", "株式会社", "corp.", "ltd", "corporation", "llc", "company"]
        for keyword in keywords {
            if artist.lowercased().contains(keyword) {
                return false
            }
        }
        return true
    }
}
