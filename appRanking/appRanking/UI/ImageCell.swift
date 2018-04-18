//import UIKit
//import SDWebImage
//
//class ImageCell: UITableViewCell {
//    let appRankingImageView = UIImageView()
//    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        contentView.addSubview(appRankingImageView)
//        
//        appRankingImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            appRankingImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            appRankingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            appRankingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            appRankingImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            appRankingImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func set(url: String) {
//        if appRankingImageView.image == nil {
//            appRankingImageView.sd_setImage(with: URL(string: url), completed: nil)
//        }
//    }
//}
//
