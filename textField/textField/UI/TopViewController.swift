import UIKit
import PureLayout

class TopViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - View Elements
    let textField = UITextField()
    let tableView = UITableView()

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
        navigationItem.title = "UITextField XCTest Sample Code"
        
        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(textField)
        view.addSubview(tableView)
    }
    
    fileprivate func configureSubviews() {
        textField.borderStyle = .roundedRect
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func applyStyles() {
    }

    fileprivate func addConstraints() {
        textField.autoPinEdge(toSuperviewEdge: .top, withInset: 100)
        textField.autoPinEdge(toSuperviewEdge: .left, withInset: 20)
        textField.autoPinEdge(toSuperviewEdge: .right, withInset: 20)
        
        tableView.autoPinEdge(.top, to: .bottom, of: textField, withOffset: 20)
        tableView.autoPinEdge(toSuperviewEdge: .left)
        tableView.autoPinEdge(toSuperviewEdge: .right)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

// MARK: - UITextFieldDelegate
extension TopViewController:UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
}

// MARK: - UITableViewDataSource
extension TopViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .lightGray
        return cell
    }

}

// MARK: - UITableViewDelegate
extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
}
