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

    
    // MARK: - Overridden methods
    
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
        let modalViewController = ModalViewController(nibName: "ModalViewController", bundle: nil)
        self.presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Overridden methods
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
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
        let offsetSpeed = self.view.frame.width
        if let visibleCells = self.collectionView.visibleCells() as? [CollectionViewCell] {
            for cell in visibleCells {
                let xOffset = ((collectionView.contentOffset.x - cell.frame.origin.x) / cell.frame.width) * offsetSpeed
                cell.setBackOffset(CGPointMake(-xOffset, 0.0))
                let alpha: Double = cell.backgroundAlpha.native as Double * min(1.0 - 2.0 * (abs(xOffset.native) as Double) / (offsetSpeed.native as Double), 1.0)
                cell.backImageView.alpha = CGFloat(alpha)
            }
        }// PresentModelViewController
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        pageControl.currentPage = Int(self.collectionView.contentOffset.x / self.collectionView.frame.size.width)
    }

}
