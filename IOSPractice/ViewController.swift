//
//  ViewController.swift
//  IOSPractice
//
//  Created by Сергей Котов on 03.07.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    let images = [UIImage(named: "ironman")?.withRoundedCorners(radius: 10), UIImage(named: "spiderman")?.withRoundedCorners(radius: 10), UIImage(named: "deadpool")?.withRoundedCorners(radius: 10)]
    let cellID = "cellID"
    
    let cellWidth = (5/6) * UIScreen.main.bounds.width
    let cellHeight = (275/399) * UIScreen.main.bounds.height
    let spacing = (1/8) * UIScreen.main.bounds.width
    let cellSpacing = (1/9) * UIScreen.main.bounds.width
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        let image = images[indexPath.item]
        let imageView = UIImageView(frame: .init(x: 0, y: 0, width: cellWidth, height: cellHeight))
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        cell.addSubview(imageView)
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: self.spacing, bottom: 0, right: self.cellSpacing)
        layout.minimumLineSpacing = self.cellSpacing
        layout.itemSize = CGSize(width: self.cellWidth, height: self.cellHeight)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 0.168627, green: 0.152, blue: 0.168627, alpha: 1.0)
        collectionView.contentInset = UIEdgeInsets(top: 0, left:0, bottom:0, right: 0)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        myView.backgroundColor =  UIColor(red: 0.168627, green: 0.152, blue: 0.168627, alpha: 1.0)
        
        self.view.addSubview(myView)
        self.view.addSubview(self.collectionView)
        
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: cellHeight).isActive = true
        self.collectionView.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
    }
}

extension UIImage {
    // image with rounded corners
    public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0 && radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw( in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
