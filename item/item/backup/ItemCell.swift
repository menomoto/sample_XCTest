import UIKit
import SDWebImage

class ItemCell: UITableViewCell {
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    
    init(item: Item) {
        super.init(style: .default, reuseIdentifier: "itemCell")
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        
        itemImageView.sd_setImage(with: URL(string: item.imageUrl), completed: nil)
        titleLabel.text = item.title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 60),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
