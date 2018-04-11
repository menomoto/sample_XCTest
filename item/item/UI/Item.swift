struct Item {
    var auctionId: String
    var imageUrl: String
    var title: String
    
    init(
        auctionId: String = "",
        imageUrl: String = "",
        title: String = ""
        ) {
        self.auctionId = auctionId
        self.imageUrl = imageUrl
        self.title = title
    }
}
