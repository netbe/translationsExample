//
//  CollectionViewController.swift
//  translations
//
//  Created by François Benaiteau on 27/11/15.
//  Copyright © 2015 Sinnerschrader Mobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

enum CollectionType {
    case None
    case Fruits
    case Colors
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var selectedSource: Array<String>?
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var collectionSourceType: CollectionType = .None {
        didSet {
            switch collectionSourceType {
            case .Fruits:
                selectedSource = fruits
                title = "Fruits"
            case .Colors:
                selectedSource = colors
                title = "Colors"
            case .None:
                selectedSource = nil
            }
        }
    }
    
    let fruits = ["Apple",
        "Apricot",
        "Avocado",
        "Banana",
        "Berry",
        "Blueberry",
        "Blackberry",
        "Cranberry",
        "Grapefruit",
        "Grape",
        "Kiwi",
        "Lemon",
        "Lychee",
        "Macadamia",
        "Nectarine",
        "Orange",
        "Peach",
        "Peanut",
        "Pine apple",
        "Raspberry",
        "Plum",
        "Strawberry",
        "Tomato",
        "Walnut",
        "Watermelon"]

    let colors = ["black",
        "darkGray",
        "lightGray",
        "white",
        "gray",
        "red",
        "green",
        "blue",
        "cyan",
        "yellow",
        "magenta",
        "orange",
        "purple",
        "brown"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.selectedSource?.count {
            return count
        }
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BasicCell
        
        cell.titleLabel.text = self.selectedSource![indexPath.row]
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CGRectGetWidth(self.view.frame), 60)
    }
}
