//
//  AllPostViewController.swift
//  Capture
//
//  Created by Gustav on 5/3/17.
//  Copyright © 2017 capture. All rights reserved.
//

import Foundation
import UIKit

class AllPostViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var AllPostcollectionView: UICollectionView!
    let layout = UserCollectionFlowLayout()
    let screenWidht = UIScreen.main.bounds.width
    var userId:Int!
    var username:String?
    var passId:Int?
    var passImg:UIImage?

    var postData: [Posts]? {
        didSet {
            if let data = postData {
                if data.count > 0 {
                    AllPostcollectionView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        getPopularPosts()
        AllPostcollectionView.reloadData()
        view.layoutIfNeeded()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func popButtonPressed(_ sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPost" {
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.viewControllers.first as! PostViewController
            vc.postThumb = passImg
            vc.postID = idToPass!
        }
    }
    func getPopularPosts() {
        SearchManager.sharedInstance.popularVideos({posts, error in
            guard posts != nil && error == nil else {
                debugPrint(error!)
                return
            }
            if let posts = posts {
                self.postData = posts
                DispatchQueue.main.async {
                    self.AllPostcollectionView.reloadData()
                    
                }
            }
        })
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = postData {
            return data.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allpostvideocell", for: indexPath) as! AllPostVideoCell
        if let data = postData , data.count > (indexPath as NSIndexPath).row {
            let row = data[(indexPath as NSIndexPath).row]
            cell.postID = row.id
            cell.thumb = row.videoThumb
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let widht = (collectionView.frame.size.width - 30) / 2
        let height:CGFloat = widht * 2 / 3
        return CGSize(width: widht, height: height)
    }
    
    func collectionView(_ colloectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) ->Bool{
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("here")
        print(indexPath)
        
        let cell = collectionView.cellForItem(at: indexPath)
        if let cell = cell as? AllPostVideoCell{
            if let id = cell.postID {
                idToPass = id
                print(id)
            }
            performSegue(withIdentifier: "showPost", sender: nil)

        }
        
    }

}
