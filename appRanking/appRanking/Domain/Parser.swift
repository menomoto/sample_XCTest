import UIKit
import SwiftyJSON

class Parser {
    
    class func item(data: Data?) -> Item {
        var item = Item()
        if let data = data {
            do {
                let json = try JSON(data: data)
                let results = json["results"]
                
                for (_, result):(String, JSON) in results {
                    if let value = result["description"].string {
                        item.description = value
                    }
                    
                    for (_, genre):(String, JSON) in result["genres"] {
                        item.genres.append(genre.string ?? "")
                    }

                    for (_, image):(String, JSON) in result["screenshotUrls"] {
                        item.images.append(image.string ?? "")
                    }

                }

            } catch {
                // error
            }
        }
        return item
    }

    
    class func ranking(data: Data?) -> [Item] {
        var items = [Item]()
        if let data = data {
            do {
                let json = try JSON(data: data)
                let results = json["feed"]["entry"]
                
                var rank = 0
                for (_, result):(String, JSON) in results {
                    rank += 1
                    var item = Item()
                    item.rank = rank
                    if let value = result["id"]["attributes"]["im:id"].string {
                        item.id = value
                    }
                    if let value = result["im:name"]["label"].string {
                        item.name = value
                    }
                    if let value = result["im:image"][2]["label"].string {
                        item.imageUrl = value // 0: 53px, 1: 75px, 2: 100px
                    }
                    if let value = result["category"]["attributes"]["label"].string {
                        item.category = value
                    }
                    if let value = result["im:artist"]["label"].string {
                        item.artist = value
                    }
                    items.append(item)
                }
            } catch {
                // error
            }
        }
        return items
    }
}
