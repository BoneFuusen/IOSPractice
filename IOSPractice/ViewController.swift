//
//  ViewController.swift
//  IOSPractice
//
//  Created by Сергей Котов on 03.07.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lazy var collectionView: UICollectionView = {
            let layout = PagingCollectionViewLayout()
            layout.sectionInset = .init(top:0, left:0, bottom:0, right:0)
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            return collectionView
        }()
        
    }
}
