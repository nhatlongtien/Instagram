//
//  FeedController.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 2/26/21.
//

import UIKit
private let reuseIdentifier = "Cell"
class FeedController: UICollectionViewController {
    //MArk: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: Helpers
    func configureUI(){
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
//MARK: UICollectionDataSource
extension FeedController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        return cell
    }
}
extension FeedController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height:CGFloat = 12 + 40 + 8 + self.view.frame.width
        height += 50
        height += 60
        return CGSize(width: self.view.frame.width, height: height)
    }
}
