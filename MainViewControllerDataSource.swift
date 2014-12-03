//
//  MainViewControllerDataSouce.swift
//  LandingPages
//
//  Created by Alexander Tovstonozhenko on 02.12.14.
//  Copyright (c) 2014 Alexander Tovstonozhenko. All rights reserved.
//

import UIKit

class MainViewControllerDataSource: NSObject, UICollectionViewDataSource {
    
    // Icons made by Stephen Hutchings from www.flaticon.com are licensed under CC BY 3.0: http://creativecommons.org/licenses/by/3.0/
    let frontImages: [String] = ["github", "shopping2", "with4"]
    let backImages: [String] = ["github", "shopping2", "with4"]
    
    
    // MARK: - Delegated methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return frontImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        cell.frontImageView!.image = UIImage(named: frontImages[indexPath.row])
        cell.backImageView!.image = UIImage(named: backImages[indexPath.row])
        cell.backImageView!.alpha = cell.backgroundAlpha
        return cell
    }
    
}