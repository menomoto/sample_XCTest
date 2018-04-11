import SwiftyJSON

class Parser {
    
    // search
    class func search(data: Data?) -> [Item] {
        var products: [Item] = []
        
        if let data = data {
            do {
                let json = try JSON(data: data.jsonp2Json())
                let items = json["ResultSet"]["Result"]["Item"]
                
                for (_, item):(String, JSON) in items {
                    var product = Item()
                    
                    if let auctionId = item["AuctionID"].string {
                        product.auctionId = auctionId
                    }
                    
                    if let imageUrl = item["Image"].string {
                        product.imageUrl = imageUrl
                    }
                    
                    if let title = item["Title"].string {
                        product.title = title
                    }
                    products.append(product)
                }
                
            } catch {
                // error
            }
        }
        return products
    }
    
    
    // item
    class func item(data: Data?) -> Item {
        var item = Item()
        
        if let data = data {
            do {
                let json = try JSON(data: data.jsonp2Json())
                let result = json["ResultSet"]["Result"]
                
                if let auctionId = result["AuctionID"].string {
                    item.auctionId = auctionId
                }
                
                if let imageUrl = result["Img"]["Image1"].string {
                    item.imageUrl = imageUrl
                }
                
                if let title = result["Title"].string {
                    item.title = title
                }
                
            } catch {
                // error
            }
        }
        
        return item
    }
}

// MARK: - Extensions
extension Data {
    func jsonp2Json() -> Data {
        if let jsonpString = String.init(data: self, encoding: .utf8) {
            let jsonString = jsonpString.replacingOccurrences(of: "loaded(", with: "").replacingOccurrences(of: ")", with: "")
            if let data = jsonString.data(using: .utf8) {
                return data
            }
        }
        return Data()
    }
}
