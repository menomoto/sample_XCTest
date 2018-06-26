import UIKit

class SummaryCell: UICollectionViewCell {
    let stackView = UIStackView()
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let separator = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
//        contentView.layer.borderWidth = 1
        contentView.addSubview(stackView)
        contentView.addSubview(separator)

        separator.backgroundColor = .red
        
        stackView.axis = .vertical
        stackView.alignment = .center
//        stackView.distribution = .fill
        stackView.spacing = 15

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
//        stackView.addArrangedSubview(label3)
//
        label1.text = "商品名: hogehogehoge"
        label1.font = UIFont.systemFont(ofSize: 24)
        label2.text = "現在価格: 1,000円"
        label2.font = UIFont.systemFont(ofSize: 24)
        label3.text = "即決価格: 2,000円"
        label3.font = UIFont.systemFont(ofSize: 24)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            contentView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width),    // OK
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 1),  // OK
//            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),  // NG
//            contentView.heightAnchor.constraint(equalToConstant: 300),
            ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
//            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15)
//            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            ])
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            separator.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separator.heightAnchor.constraint(equalToConstant: 2),
            ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


