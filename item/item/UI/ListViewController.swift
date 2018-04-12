
import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate(set) var items: [Item] = []

    // MARK: - View Elements
    let searchBar = UISearchBar()
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
        navigationItem.title = "Search Items"
        
        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    fileprivate func configureSubviews() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func applyStyles() {
    }

    fileprivate func addConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }
    
    fileprivate func request(query: String) {
        guard let encodeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let searchUrl = "https://auctions.yahooapis.jp/AuctionWebService/V2/json/search?appid=dj0zaiZpPU1aMWppaDVwUFFSTSZzPWNvbnN1bWVyc2VjcmV0Jng9MTc-&results=50&query="

        let url = searchUrl + encodeQuery
        ApiClient.request(url: url, completion: { data, res, error in
            self.items = Parser.search(data: data)
            self.tableView.reloadData()
        })
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == items.count {
            return ItemListCell(items: items)
        } else {
            return ItemCell(item: items[indexPath.row])
        }
    }

}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == items.count {
            return CGFloat(items.count/2) * (UIScreen.main.bounds.width/2)
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewController = ItemViewController(item: items[indexPath.row])
//        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        request(query: query)
    }
}
