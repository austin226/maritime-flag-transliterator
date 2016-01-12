//
//  FlagCollectionViewController.swift
//  Maritime Flag Transliterator
//
//  Created by Austin Almond on 1/11/16.
//  Copyright © 2016 Austin Almond. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FlagCell"

class FlagCollectionViewController: UICollectionViewController {
    
    var flagImages = [String]()
    var flagTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        flagImages = ["alpha", "bravo", "charlie", "delta", "echo", "foxtrot",
                        "golf", "hotel", "india", "juliet", "kilo", "lima", "mike",
                        "november", "oscar", "papa", "quebec", "romeo", "sierra",
                        "tango", "uniform", "victor", "whiskey", "xray", "yankee", "zulu"]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return flagImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FlagCollectionViewCell
    
        // Configure the cell
        let flagName = flagImages[indexPath.row]
        let image = UIImage(named: flagName)
        cell.imageView.image = image
        
        let initialChar = String(flagName[flagName.startIndex]).uppercaseString
        let tapGestureRecognizer = FlagTapGestureRecognizer(target: self, action: Selector("imageTapped:"), output: initialChar)
        
        cell.imageView.userInteractionEnabled = true
        cell.imageView.addGestureRecognizer(tapGestureRecognizer)
    
        return cell
    }
    
    func imageTapped(img: AnyObject) {
        if let flag_output = (img as! FlagTapGestureRecognizer).output {
            flagTextField!.text = flagTextField!.text?.stringByAppendingString(flag_output)
        }
    }
    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: HeaderView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                        withReuseIdentifier: "ViewHeader", forIndexPath: indexPath)
                    as? HeaderView
                
                header?.headerLabel.text = "Maritime Flag Transliterator"
                flagTextField = header?.flagTextField
            }
            return header!
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
