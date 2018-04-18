//import UIKit
//import SDWebImage
//
//class ItemListCell: UITableViewCell {
//    let collectionView: UICollectionView
//    let appRankings: [Item]
//    
//    init(appRankings: [Item]) {
//        self.appRankings = appRankings
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        let width = UIScreen.main.bounds.width / 2
//        layout.itemSize = CGSize(width: width, height: width)
//        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        
//        super.init(style: .default, reuseIdentifier: "ItemListCell")
//
//        contentView.addSubview(collectionView)
//        collectionView.dataSource = self
//        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: "ImageCollectionCell")
//        
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//extension ItemListCell: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return appRankings.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as? ImageCollectionCell else { return UICollectionViewCell() }
//        cell.set(url: appRankings[indexPath.row].imageUrl)
//        return cell
//    }
//}

