import UIKit
import PureLayout

class NextViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - View Elements
    
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
        view.backgroundColor = .yellow
        navigationItem.title = "次画面"
        
        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
    }
    
    fileprivate func configureSubviews() {
    }

    fileprivate func applyStyles() {
    }
    
    fileprivate func addConstraints() {
    }
}

