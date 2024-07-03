//
//  ViewController.swift
//  IOSPractice
//
//  Created by Сергей Котов on 03.07.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: cellWidth, height: cellWidth))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "ironman")
        cell.addSubview(imageView)
        
        return cell
    }
    
    let cellWidth = (3/4) * UIScreen.main.bounds.width
//    let cellHeight = (3/5) * UIScreen.main.bounds.height
    let spacing = (1/8) * UIScreen.main.bounds.width
    let cellSpacing = (1/16) * UIScreen.main.bounds.width
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.sectionInset = .init(top: 0, left: self.spacing, bottom: 0, right: self.spacing)
        layout.minimumLineSpacing = self.cellSpacing
        layout.itemSize = .init(width: self.cellWidth, height: self.cellWidth)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 43.0, green: 39.0, blue: 43.0, alpha: 1.0)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: cellWidth).isActive = true
    }
}
