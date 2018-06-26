import UIKit

class RecommendViewController: UIViewController {

    // MARK: - Properties
    fileprivate(set) var items: [Item] = []

    // MARK: - View Elements
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
        navigationItem.title = "Recommend Items"

        addSubviews()
        configureSubviews()
        addConstraints()

        request()
    }
    
    // MARK: - View Setup
    fileprivate func addSubviews() {
        view.addSubview(tableView)
    }

    fileprivate func configureSubviews() {
        tableView.backgroundColor = .white

        tableView.dataSource = self
        tableView.register(SummaryCell.self, forCellReuseIdentifier: "SummaryCell")
        tableView.register(RecommendCell.self, forCellReuseIdentifier: "RecommendCell")

        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.refreshControl = refresh
    }

    @objc fileprivate func didPullToRefresh() {
        request()
    }


    fileprivate func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
    }

    fileprivate func request() {
        let querys = ["ipad", "Tシャツ", "車", "本", "adidas"]
        let query = querys[Int(arc4random_uniform(5))]
        let sorts = ["%2Bend_time", "%2Dend_time", "%2Bprice", "%2Dprice", "%2Bbid_count"]
        let sort = sorts[Int(arc4random_uniform(5))]
        guard let encodeQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = "https://auctions.yahooapis.jp/AuctionWebService/V2/json/search?appid=dj0zaiZpPU1aMWppaDVwUFFSTSZzPWNvbnN1bWVyc2VjcmV0Jng9MTc-&results=100&sort=\(sort)&query=\(encodeQuery)"
        print(url)
        ApiClient.request(url: url, completion: { data, res, error in
            self.tableView.refreshControl?.endRefreshing()
            self.items = Parser.search(data: data)
            self.tableView.reloadData()
        })
    }
}

extension RecommendViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return items.count / 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else { return UITableViewCell() }
            cell.set(items: recommendItems(column: 2, indexPath: indexPath), tapHandler: { [weak self] item in
                let vc = ItemViewController.init(item: item)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as? SummaryCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func recommendItems(column: Int, indexPath: IndexPath) -> [Item] {
        let index = indexPath.row * column
        print(index)
        var recommends = [Item]()
        for i in 0..<column {
            recommends.append(items[index+i])
        }
        return recommends
    }
}
