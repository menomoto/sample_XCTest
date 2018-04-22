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
    var rating: Int
    var ratingCount: Int
    
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
        date: String = "",
        rating: Int = 0,
        ratingCount: Int = 0
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
        self.rating = rating
        self.ratingCount = ratingCount
    }
    
    var isPersonal: Bool {
        let keywords = [
            "inc", "株式会社", "corp", "ltd", "corporation", "llc",
            "company", "game", "k.k.", "法人", "apps", "ntt",
            "conference", "limited", "llp", "s.a."
            ]
        for keyword in keywords {
            if artist.lowercased().contains(keyword) {
                return false
            }
            if artist.split(separator: " ").count != 2 {
                return false
            }
        }
        return true
    }
}
