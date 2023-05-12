//
//  PhotoViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/22.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

final class PhotoViewController: BaseViewController {

    private var dummyCase = Photo.dummy() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: flowLayout)
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setStyle() {
        
        view.backgroundColor = .white
        
        collectionView.do {
            $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
        
        flowLayout.do {
            $0.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: UIScreen.main.bounds.width / 3)
            $0.minimumLineSpacing = 3
            $0.minimumInteritemSpacing = 3
        }
    }
    
    override func setLayout() {
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate {}

extension PhotoViewController: UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummyCase[indexPath.item])
        
        cell.handler = { [weak self] in
            guard let self = self else { return }
            self.dummyCase[indexPath.item].heartTapped.toggle()
        }

        return cell
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

