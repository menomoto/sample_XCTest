import UIKit
import SDWebImage

class ImageCollectionCell: UICollectionViewCell {
    let itemImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)

        let imageHeight: CGFloat = (UIScreen.main.bounds.width - (15 * 3)) / 2

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: imageHeight),
            contentView.heightAnchor.constraint(equalToConstant: imageHeight),
            ])

        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            itemImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            itemImageView.heightAnchor.constraint(equalToConstant: imageHeight),
//            itemImageView.widthAnchor.constraint(equalToConstant: imageHeight),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(url: String) {
//        if itemImageView.image == nil {
        itemImageView.sd_setImage(with: URL(string: url), completed: nil)
//        }
    }
}


class DummyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .green

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.heightAnchor.constraint(equalToConstant: 200),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

