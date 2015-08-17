//
//  PhotoAlbumCollectionViewCell.swift
//  MealBird
//
//  Created by minami on 8/16/15.
//  Copyright (c) 2015 div2_e. All rights reserved.
//

import UIKit

class PhotoAlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    let queue = NSOperationQueue()
    
    override func awakeFromNib() {
        self.imageView.image = UIImage(named: "sekisei_inko.png")
        self.imageView.alpha = 0.5
    }
    
    func setImage(data:NSData) {
        self.indicator.startAnimating()
        self.indicator.hidden = false
        
        queue.cancelAllOperations()
        let operation = NSBlockOperation()
        weak var weakOperation = operation
        weak var weakSelf = self
        operation.addExecutionBlock({
             let image = UIImage(data: data)
             self.imageView.image = image
             self.imageView.alpha = 1.0
             self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(90.0 * M_PI / 180))
        })
        NSOperationQueue.mainQueue().addOperationWithBlock({
        })
        queue.addOperation(operation)
        
    }


}
