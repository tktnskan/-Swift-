//
//  imageSlideCell.swift
//  YogiyoClone
//
//  Created by Jinyung Yoon on 24/09/2019.
//  Copyright © 2019 Jinyung Yoon. All rights reserved.
//

import UIKit

class imageSlideCell: UITableViewCell {
    var timer: Timer?
    private let images = ["ad1", "ad2", "ad3", "ad4", "ad5", "ad6", "ad1"]
    var pageControl = UIPageControl()
    @IBOutlet weak var imageCollectionView: UICollectionView!{
        didSet {
            self.imageCollectionView.delegate = self
            self.imageCollectionView.dataSource = self
            pageControl.numberOfPages = images.count
            startTimer(time: 1.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        pageControl.numberOfPages = images.count
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / imageCollectionView.frame.width)
        pageControl.currentPage = pageNumber
    }

    
    @objc
    func scrollToNextCell() {
        let page = pageControl.currentPage
        if page == images.count - 1 {
            DispatchQueue.global().sync {
                imageCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: UICollectionView.ScrollPosition.left, animated: false)
            }
            pageControl.currentPage = 0

        } else {
            imageCollectionView.scrollToItem(at: IndexPath(row: page + 1, section: 0), at: UICollectionView.ScrollPosition.right, animated: true)

            pageControl.currentPage += 1
        }

    }

    /**
     call this method when collection view loaded
     */
    func startTimer(time: CGFloat) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(time), target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        }
    }


}


extension imageSlideCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(images.count)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? imageCell
        
        cell!.imageView.image = UIImage(named: images[indexPath.row])
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    
}
