import UIKit

class ItemViewController: UIViewController {
    
    // MARK: - Properties
    fileprivate(set) var item = Item()

    // MARK: - View Elements
    let tableView = UITableView()
    
    // MARK: - Initializers
    init(item: Item) {
        self.item = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Item Detail"
        
        request()
        addSubviews()
        configureSubviews()
        applyStyles()
        addConstraints()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(tableView)
    }
    
    fileprivate func configureSubviews() {
        tableView.dataSource = self
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.register(SummaryCell.self, forCellReuseIdentifier: "SummaryCell")
    }
    
    fileprivate func applyStyles() {
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
        let itemUrl = "https://auctions.yahooapis.jp/AuctionWebService/V2/json/auctionItem?appid=dj0zaiZpPU1aMWppaDVwUFFSTSZzPWNvbnN1bWVyc2VjcmV0Jng9MTc-&results=20&auctionID="
        
        let url = itemUrl + item.auctionId
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as? SummaryCell else { return UITableViewCell() }
        cell.set(item: item)
        
        return cell
    }
    
}
