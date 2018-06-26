import UIKit
import SDWebImage

class ImageCollectionCell: UICollectionViewCell {
    let itemImageView = UIImageView()
    fileprivate(set) var cellLeftMargin: NSLayoutConstraint = NSLayoutConstraint()
    fileprivate(set) var cellRightMargin: NSLayoutConstraint = NSLayoutConstraint()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemImageView)

        let cellHeight: CGFloat = (UIScreen.main.bounds.width / 2) - 1

        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: cellHeight),
            contentView.heightAnchor.constraint(equalToConstant: cellHeight),
            ])

        cellLeftMargin = itemImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15)
        cellRightMargin = itemImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15)

        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellLeftMargin,
            cellRightMargin,
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(url: String, itemRow: Int) {
        itemImageView.sd_setImage(with: URL(string: url), completed: nil)

        cellLeftMargin.constant = (itemRow % 2) == 0 ? 15 : 7.5
        cellRightMargin.constant = (itemRow % 2) == 0 ? -7.5 : -15
    }
}


class DummyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            contentView.heightAnchor.constraint(equalToConstant: 200),
            ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

