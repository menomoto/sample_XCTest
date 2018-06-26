import UIKit

class RecommendCell: UITableViewCell {
    let stackView = UIStackView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        
        selectionStyle = .none
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        let stackViewHeight = (UIScreen.main.bounds.width - (15 * 3)) / 2 + 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            stackView.heightAnchor.constraint(equalToConstant: stackViewHeight),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(items: [Item], tapHandler: @escaping (Item)->() ) {
        if stackView.subviews.count == 2 {
            for subView in stackView.subviews {
                subView.removeFromSuperview()
            }
        }

        for item in items {
            let recommendView = RecommendView(item: item, tapHandler: tapHandler)
            stackView.addArrangedSubview(recommendView)
        }
    }
}
