//
//  ModalViewController.swift
//  LandingPages
//
//  Created by Alexander Tovstonozhenko on 03.12.14.
//  Copyright (c) 2014 Alexander Tovstonozhenko. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    
    
    // MARK: - Action methods
    
    @IBAction func buttonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
