import UIKit

class ItemViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate(set) var item = Item()
    
    // MARK: - View Elements
    let tableView = UITableView()
    
    // MARK: - Initializers
    init(
        item: Item
        ) {
        self.item = item
        
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
    }
    
    fileprivate func configureSubviews() {
        view.backgroundColor = .white
        navigationItem.title = item.name
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ImagesCell.self, forCellReuseIdentifier: "ImagesCell")
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
    fileprivate func request() {
        let url = "https://itunes.apple.com/lookup?id=\(item.id)&country=JP"
        ApiClient.request(url: url, completion: { data, res, error in
            self.item = Parser.item(data: data)
            self.tableView.reloadData()
        })
    }
}

// MARK: - UITableViewDataSource
extension ItemViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = .systemFont(ofSize: 12)

        switch indexPath.row {
        case 0:
            guard let imagesCell = tableView.dequeueReusableCell(withIdentifier: "ImagesCell", for: indexPath) as? ImagesCell else { return UITableViewCell() }
            imagesCell.set(images: item.images)
            return imagesCell
        case 1:
            cell.textLabel?.text = "ジャンル: \(item.genres.joined(separator: ", "))"
            return cell
        case 2:
            cell.textLabel?.text = "評価: \(item.rating)(\(item.ratingCount))"
            return cell
        case 3:
            cell.textLabel?.text = "リリース: \(item.date.prefix(10))"
            return cell
        case 4:
            cell.textLabel?.text = item.description
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension ItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

