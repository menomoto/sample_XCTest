import UIKit
import PureLayout

class StackViewController: UIViewController {

    // MARK: - Properties

    // MARK: - View Elements
    let contentView = UIView()
    let stackView = UIStackView()

    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "StackView サンプル"

        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }

    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(contentView)
        contentView.addSubview(stackView)
    }

    fileprivate func configureSubviews() {
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .yellow

        stackView.axis = .vertical
        stackView.alignment = .leading
//        stackView.distribution = .fillProportionally
        stackView.spacing = 10

        for index in 0..<10 {
            stackView.addArrangedSubview(configureStackViewItem(indexRow: index))
        }
    }

    fileprivate func configureStackViewItem(indexRow: Int) -> UIView {
        let stackViewItem = UIStackView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        stackViewItem.axis = .horizontal
        stackViewItem.alignment = .center
//        stackViewItem.distribution = .equalSpacing
        stackViewItem.spacing = 10

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 14))
        label.numberOfLines = 0
        label.backgroundColor = .blue
        label.text = "Left No. \(indexRow)"

        stackViewItem.addArrangedSubview(label)

        let label2 = UILabel()
        label2.numberOfLines = 0
        label2.backgroundColor = .red
        label2.text = "あいうえおあいうえおRight No. \(indexRow)"
//        label2.setContentHuggingPriority(48, for: .horizontal)

        stackViewItem.addArrangedSubview(label2)

        return stackViewItem
    }

    fileprivate func applyStyles() {
    }

    fileprivate func addConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),

            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ])
    }
}


