//
//  CollectionViewCell.swift
//  LandingPages
//
//  Created by Alexander Tovstonozhenko on 02.12.14.
//  Copyright (c) 2014 Alexander Tovstonozhenko. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var baseImageOrigin: CGPoint = CGPoint()
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    
    // MARK: - Instance initialization
    
    override init() {
        super.init()
        self.backgroundView = backImageView
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - Private methods
    
    func setImageOffset(offset: CGPoint) {
        frontImageView.frame = CGRectOffset(self.frontImageView.bounds, offset.x, offset.y)
    }
    
    func setBackOffset(offset: CGPoint) {
        backImageView.frame = CGRectOffset(backImageView.bounds, offset.x, offset.y)
    }
    
}
