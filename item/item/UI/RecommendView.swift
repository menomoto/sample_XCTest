import UIKit
import SDWebImage

class RecommendView: UIView {
    let item: Item
    let tapHandler: (Item) -> ()
    
    init(item: Item, tapHandler: @escaping (Item)->() ) {
        self.item = item
        self.tapHandler = tapHandler
        
        super.init(frame: .zero)
        
        let imageView = UIImageView()
        let titleLabel = UILabel()
        let button = UIButton(type: .system)
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(button)
        
        // tap gesture
//        isUserInteractionEnabled = true
//        let tapGesture = UIGestureRecognizer.init(target: self, action: #selector(didTapItem))
//        imageView.addGestureRecognizer(tapGesture)
//        imageView.isUserInteractionEnabled = true
        
        imageView.sd_setImage(with: URL(string: item.imageUrl), completed: nil)
        titleLabel.text = item.auctionId
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .lightGray
        titleLabel.alpha = 0.9
        
        button.addTarget(self, action: #selector(didTapItem), for: .touchUpInside)
        
        let imageWidth = (UIScreen.main.bounds.width - (15 * 3)) / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageWidth),
            imageView.widthAnchor.constraint(equalToConstant: imageWidth),
            ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 16),
            ])

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leftAnchor.constraint(equalTo: leftAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapItem() {
        tapHandler(item)
    }
}
