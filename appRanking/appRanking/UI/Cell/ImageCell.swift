import UIKit
import SDWebImage

class ImageCell: UICollectionViewCell {
    let itemImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)
        itemImageView.contentMode = .scaleAspectFill
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
    }
    
    func set(image: String) {
        itemImageView.sd_setImage(with: URL(string: image), completed: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
