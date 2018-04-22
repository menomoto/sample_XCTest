import UIKit

enum Type {
    case normal
    case personal
}

class ListViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate(set) var items: [Item] = []
    fileprivate(set) var items4P: [Item] = []
    let genreName: String
    let genreId: Int
    fileprivate(set) var type: Type = .normal

    // MARK: - View Elements
    let tableView = UITableView()
    let typeButton = UIButton(type: .system)

    // MARK: - Initializers
    init(
        genreName: String,
        genreId: Int
        ) {
        self.genreName = genreName
        self.genreId = genreId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        request()
        addSubviews()
        configureSubviews()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(typeButton)
    }
    
    fileprivate func configureSubviews() {
        view.backgroundColor = .white
        navigationItem.title = genreName
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        tableView.estimatedRowHeight = 40
        tableView.tableFooterView = UIView()
        
//        typeButton.titleLabel?.font = UIFont.init(name: "HiraKakuProN-W6", size: 14)
        typeButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        typeButton.titleLabel?.numberOfLines = 3
        typeButton.titleLabel?.textAlignment = .center
        typeButton.backgroundColor = .white
        typeButton.layer.borderWidth = 3
        typeButton.layer.cornerRadius = 35
        typeButton.addTarget(self, action: #selector(didTapTypeButton), for: .touchUpInside)
        configureTypeButton()
    }
    
    fileprivate func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        typeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            typeButton.heightAnchor.constraint(equalToConstant: 70),
            typeButton.widthAnchor.constraint(equalToConstant: 70),
            typeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            typeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
        ])
    }
    
    fileprivate func request() {
        let url = "https://itunes.apple.com/jp/rss/topfreeapplications/limit=200/genre=\(genreId)/json"
        ApiClient.request(url: url, completion: { data, res, error in
            self.items = Parser.ranking(data: data)
            self.items4P = self.items.filter{ $0.isPersonal }
            self.tableView.reloadData()
        })
    }
    
    @objc fileprivate func didTapTypeButton() {
        type = (type == .normal) ? .personal : .normal
        configureTypeButton()
        tableView.reloadData()
    }
    
    fileprivate func configureTypeButton() {
        switch type {
        case .normal:
            typeButton.setTitle("個人\nモード\nOFF", for: .normal)
            typeButton.setTitleColor(.lightGray, for: .normal)
            typeButton.layer.borderColor = UIColor.lightGray.cgColor
        case .personal:
            typeButton.setTitle("個人\nモード\nON", for: .normal)
            typeButton.setTitleColor(UIColor(hex: "ff0000", alpha: 0.87), for: .normal)
            typeButton.layer.borderColor = UIColor(hex: "ff0000", alpha: 0.87).cgColor
        }
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type == .normal ? items.count : items4P.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UITableViewCell() }
        cell.set(item: type == .normal ? items[indexPath.row] : items4P[indexPath.row])
        return cell
    }

}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ItemViewController(item: type == .normal ? items[indexPath.row] : items4P[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
