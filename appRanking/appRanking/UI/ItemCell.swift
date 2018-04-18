import UIKit
import SDWebImage

class ItemCell: UITableViewCell {
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let typeLabel = UILabel()
    let artistLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(artistLabel)

        selectionStyle = .none
        
        itemImageView.layer.cornerRadius = 10
        itemImageView.layer.borderWidth = 0.5
        itemImageView.clipsToBounds = true
        itemImageView.layer.borderColor = UIColor.lightGray.cgColor

        titleLabel.font = .systemFont(ofSize: 16)

        subTitleLabel.font = .systemFont(ofSize: 12)
        subTitleLabel.textColor = .gray

        typeLabel.font = .systemFont(ofSize: 12)
        typeLabel.textColor = .red
        typeLabel.textAlignment = .center
        typeLabel.layer.cornerRadius = 3
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.borderColor = UIColor.red.cgColor

        artistLabel.font = .systemFont(ofSize: 12)
        artistLabel.textColor = .blue
        

        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            itemImageView.heightAnchor.constraint(equalToConstant: 53),
            itemImageView.widthAnchor.constraint(equalToConstant: 53),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            artistLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5),
            artistLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            artistLabel.trailingAnchor.constraint(equalTo: typeLabel.leadingAnchor, constant: -5),
            artistLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),

            typeLabel.topAnchor.constraint(equalTo: artistLabel.topAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            typeLabel.heightAnchor.constraint(equalToConstant: 14),
            typeLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func set(item: Item) {
        itemImageView.sd_setImage(with: URL(string: item.imageUrl), completed: nil)
        titleLabel.text = "\(item.rank) \(item.name)"
        subTitleLabel.text = "\(item.category)\n\(item.artist)"

        if item.isStore {
            typeLabel.text = ""
            typeLabel.isHidden = true
        } else {
            typeLabel.text = "Personal?"
            typeLabel.isHidden = false
        }
        artistLabel.text = item.artist
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

