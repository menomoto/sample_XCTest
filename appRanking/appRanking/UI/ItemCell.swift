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
        itemImageView.layer.borderColor = UIColor(hex: "000000", alpha: 0.26).cgColor

        titleLabel.font = .systemFont(ofSize: 16)

        subTitleLabel.font = .systemFont(ofSize: 12)
        subTitleLabel.textColor = UIColor(hex: "000000", alpha: 0.54)

        typeLabel.font = .systemFont(ofSize: 12)
        typeLabel.textColor = UIColor(hex: "ff0000", alpha: 0.87)
        typeLabel.textAlignment = .center
        typeLabel.layer.cornerRadius = 3
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.borderColor = UIColor(hex: "ff0000", alpha: 0.87).cgColor

        artistLabel.font = .systemFont(ofSize: 12)
        artistLabel.textColor = UIColor(hex: "0000ff", alpha: 0.87)
        

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
        titleLabel.text = "\(item.rank)　\(item.name)"
        subTitleLabel.text = "\(item.category)\n\(item.artist)"

        if item.isPersonal {
            typeLabel.text = "Personal?"
            typeLabel.isHidden = false
            backgroundColor = UIColor(hex: "0000ff", alpha: 0.03)
        } else {
            typeLabel.text = ""
            typeLabel.isHidden = true
            backgroundColor = .white
        }
        artistLabel.text = item.artist
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
