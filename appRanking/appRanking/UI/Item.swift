import UIKit

struct Item {
    var rank: Int
    var name: String
    var imageUrl: String
    var summary: String
    var price: Int
    var category: String
    var artist: String
    var date: String
    
    init(
        rank: Int = 0,
        name: String = "",
        imageUrl: String = "",
        summary: String = "",
        price: Int = 0,
        category: String = "",
        artist: String = "",
        date: String = ""
        ) {
        self.rank = rank
        self.name = name
        self.imageUrl = imageUrl
        self.summary = summary
        self.price = price
        self.category = category
        self.artist = artist
        self.date = date
    }
    
    var isStore: Bool {
        let keywords = ["inc", "株式会社", "corp.", "ltd", "corporation", "llc", "company"]
        for keyword in keywords {
            if artist.lowercased().contains(keyword) {
                return true
            }
        }
        return false
    }
}
