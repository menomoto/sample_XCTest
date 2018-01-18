import UIKit

class TopViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - View Elements
    let pushButton = UIButton(type: .system)

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
        navigationItem.title = "トップ"
        
        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(pushButton)
    }
    
    fileprivate func configureSubviews() {
        pushButton.setTitle("StackView サンプル", for: .normal)
        pushButton.addTarget(self, action: #selector(didTapPushButton), for: .touchUpInside)
    }
    
    fileprivate func applyStyles() {
    }

    fileprivate func addConstraints() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
    }
    
    @objc fileprivate func didTapPushButton() {
        let viewController = StackViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
