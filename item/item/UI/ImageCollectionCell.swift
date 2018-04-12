import UIKit
import SDWebImage

class ImageCollectionCell: UICollectionViewCell {
    let itemImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            itemImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(url: String) {
        if itemImageView.image == nil {
            itemImageView.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
}


