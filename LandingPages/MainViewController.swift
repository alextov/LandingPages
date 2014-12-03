//
//  ViewController.swift
//  LandingPages
//
//  Created by Alexander Tovstonozhenko on 02.12.14.
//  Copyright (c) 2014 Alexander Tovstonozhenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var dataSource = MainViewControllerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = self.dataSource
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonTapped(sender: AnyObject) {
//
    }
    
    
    // MARK: - Overridden methods
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        let currentPage = pageControl.currentPage
        coordinator.animateAlongsideTransition({ context in
            self.collectionView.contentOffset.x = CGFloat(currentPage) * size.width
            self.collectionView.reloadData()
            }, completion: nil)
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    
    
    // MARK: - Delegated methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return self.collectionView.frame.size
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetSpeed: CGFloat = 100//50.0
        if let visibleCells = self.collectionView.visibleCells() as? [CollectionViewCell] {
            for cell in visibleCells {
                let xOffset = ((collectionView.contentOffset.x - cell.frame.origin.x) / cell.frame.width) * offsetSpeed
                cell.setBackOffset(CGPointMake(abs(xOffset), 0.0))
//                println("offset: \(xOffset)\t\(cell.backImageView.frame.origin))")
//                println(cell.baseImageOrigin.x)
//                println(cell.backImageView.bounds)

//                println(cell.frame)
//                cell.setBackOffset(CGPointMake(xOffset, 0))
                
//                let xOffset = ((collectionView.contentOffset.x - cell.frame.origin.x) / cell.frontImageView.frame.width) * offsetSpeed
//                cell.setImageOffset(CGPointMake(xOffset + cell.baseImageOrigin.x, cell.frontImageView.frame.origin.y))
//                if abs(xOffset) > 0 {
//                    cell.frontImageView.alpha = cell.baseImageOrigin.x / 2 / abs(xOffset)
//                } else {
//                    cell.frontImageView.alpha = 1
//                }
            }
            println()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width)
    }

}
