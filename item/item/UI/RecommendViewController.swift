import UIKit

class RecommendViewController: UIViewController {

    // MARK: - Properties
    fileprivate(set) var items: [Item] = []

    // MARK: - View Elements
    let collectionView: UICollectionView

    // MARK: - Initializers
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 15
//        layout.minimumInteritemSpacing = 15
//        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize

        collectionView = UICollectionView(frame:  CGRect(origin: CGPoint.zero, size: UIScreen.main.bounds.size), collectionViewLayout: layout)

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
        view.addSubview(collectionView)
    }

    fileprivate func configureSubviews() {
        collectionView.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DummyCell.self, forCellWithReuseIdentifier: "DummyCell")
        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: "ImageCollectionCell")

        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        collectionView.refreshControl = refresh
    }

    @objc fileprivate func didPullToRefresh() {
        request()
    }


    fileprivate func addConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
            self.collectionView.refreshControl?.endRefreshing()
            self.items = Parser.search(data: data)
            self.collectionView.reloadData()
        })
    }
}

// MARK: - UICollectionViewDataSource
extension RecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 1:
            return items.count
        default:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as? ImageCollectionCell else { return UICollectionViewCell() }

            cell.set(url: items[indexPath.row].imageUrl)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DummyCell", for: indexPath) as? DummyCell else { return DummyCell() }
            return cell
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 1:
            return 15
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 1:
            return 15
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 1:
            return UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
        default:
            return .zero
        }
    }
}