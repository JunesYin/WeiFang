//
//  ContentViewController.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit


fileprivate let cvPicsX = HorizontalMarginLeft * (SCREEN_WIDTH / DEFAULT_WIDTH)
fileprivate let cvPicsY = VerticalMarginTop * (SCREEN_HEIGHT / DEFAULT_HEIGHT)
fileprivate let cvPicsWidth = SCREEN_WIDTH * ((DEFAULT_WIDTH - HorizontalMarginLeft - HorizontalMarginRight) / DEFAULT_WIDTH)
fileprivate let cvPicsHeight = SCREEN_HEIGHT * ((DEFAULT_HEIGHT - VerticalMarginTop - VerticalMarginBottom) / DEFAULT_HEIGHT)
fileprivate let cvPicItemWidth = cvPicsWidth
fileprivate let cvPicItemHeight = cvPicsHeight
fileprivate let ContentCellReuseIdentifier = "ContentCellReuseIdentifier"

fileprivate let lbTextWidth = SCREEN_WIDTH / 2.0
fileprivate let lbTextHeight: CGFloat = 30.0
fileprivate let lbTextFont: CGFloat = 16.0


class ContentViewController: UIViewController {

    // MARK: - Public properties
    var arrPicName: Array<String>!
    
    
    // MARK: - View
    var cvPics: UICollectionView!
    var lbText: UILabel!
    
    // MARK: - Private properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbText.text = "1/\(arrPicName.count)"
    }
    
    
    func initUI() {
        
        // 背景
        let imgViewBackdrop = UIImageView(frame: view.bounds)
        imgViewBackdrop.image = Util.image(named: "Major_backdrop")
        view.addSubview(imgViewBackdrop)
        
        // CollectionView布局
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: cvPicItemWidth, height: cvPicItemHeight)
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        // CollectionView
        cvPics = UICollectionView(frame: CGRect(x: cvPicsX, y: cvPicsY, width: cvPicsWidth, height: cvPicsHeight),
                                  collectionViewLayout: collectionViewFlowLayout)
        cvPics.backgroundColor = .clear
        cvPics.delegate = self
        cvPics.dataSource = self
        cvPics.isPagingEnabled = true
        cvPics.showsHorizontalScrollIndicator = false
        cvPics.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCellReuseIdentifier)
        view.addSubview(cvPics)
        
        
        // 数字
        lbText = UILabel(frame: CGRect(x: SCREEN_WIDTH / 2.0 - lbTextWidth / 2.0,
                                       y: cvPics.ly_bottom + VerticalMargin,
                                       width: lbTextWidth,
                                       height: lbTextHeight))
        lbText.textColor = .white
        lbText.font = Util.font(size: lbTextFont)
        lbText.textAlignment = .center
        view.addSubview(lbText)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}



// MARK: - UICollectionViewDelegate
extension ContentViewController: UICollectionViewDelegate {
    
}



// MARK: - UICollectionViewDataSource
extension ContentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPicName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellReuseIdentifier, for: indexPath) as! ContentCollectionViewCell
        
        cell.imageView.image = Util.image(named: arrPicName[indexPath.row])
        
        return cell
    }
}


// MARK: - UIScrollViewDelegate
extension ContentViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let times = Int(offsetX / SCREEN_WIDTH + 0.1)
        
        lbText.text = "\(times + 1)/\(arrPicName.count)"
    }
    
}


