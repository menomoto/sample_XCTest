import UIKit
import SDWebImage

class ItemCell: UITableViewCell {
    fileprivate(set) var item = Item()
    
    let itemImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let typeLabel = UILabel()
    let artistButton = UIButton(type: .system)

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(artistButton)

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

        artistButton.titleLabel?.font = .systemFont(ofSize: 12)
        artistButton.titleLabel?.textColor = UIColor(hex: "0000ff", alpha: 0.87)
        artistButton.titleLabel?.textAlignment = .left
        artistButton.titleEdgeInsets = .zero

        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        artistButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            itemImageView.heightAnchor.constraint(equalToConstant: 50),
            itemImageView.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),

            artistButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5),
            artistButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            artistButton.trailingAnchor.constraint(lessThanOrEqualTo: typeLabel.leadingAnchor, constant: 5),
            artistButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            artistButton.heightAnchor.constraint(equalToConstant: 14),
            
            typeLabel.topAnchor.constraint(equalTo: artistButton.topAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            typeLabel.heightAnchor.constraint(equalToConstant: 14),
            typeLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    func set(item: Item) {
        self.item = item
        
        itemImageView.sd_setImage(with: URL(string: item.imageUrl), completed: nil)
        titleLabel.text = "\(item.rank)　\(item.name)"
        subTitleLabel.text = "\(item.category)\n\(item.artist)"

        if item.isPersonal {
            typeLabel.text = "Personal?"
            typeLabel.isHidden = true // デザイン調整のため非表示
            backgroundColor = UIColor(hex: "0000ff", alpha: 0.02)
        } else {
            typeLabel.text = ""
            typeLabel.isHidden = true
            backgroundColor = .white
        }
        artistButton.setTitle(item.artist, for: .normal)
        artistButton.addTarget(self, action: #selector(didTapArtistButton), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func didTapArtistButton() {
        
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
