//
//  InvestmentViewController.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

fileprivate let cvProjectsX = HorizontalMarginLeft * (SCREEN_WIDTH / DEFAULT_WIDTH)
fileprivate let cvProjectsY = VerticalMarginTopLarge * (SCREEN_HEIGHT / DEFAULT_HEIGHT)
fileprivate let cvProjectsWidth = SCREEN_WIDTH * ((DEFAULT_WIDTH - HorizontalMarginLeft - HorizontalMarginRight) / DEFAULT_WIDTH)
fileprivate let cvProjectsHeight = SCREEN_HEIGHT * ((DEFAULT_HEIGHT - VerticalMarginTopLarge - VerticalMarginBottomLarge) / DEFAULT_HEIGHT)
fileprivate let cvProjectsCellHeight = cvProjectsHeight
fileprivate let cvProjectsCellWidth = cvProjectsWidth / cvProjectsCellNumByPage
fileprivate let cvProjectsCellNumByPage: CGFloat = 4
fileprivate let InvestmentCellReuseIdentifier = "InvestmentCellReuseIdentifier"

fileprivate let lbTextWidth = SCREEN_WIDTH / 2.0
fileprivate let lbTextHeight: CGFloat = 30.0
fileprivate let lbTextFont: CGFloat = 16.0

fileprivate let projectPicCount = 30
fileprivate let projectPicPrefix = "InvestmentProjects_"
fileprivate let projPicNames = [["1"],
                                ["2"],
                                ["3"],
                                ["4"],
                                ["5"],
                                ["6"],
                                ["7"],
                                ["8"],
                                ["9"],
                                ["10"],
                                ["11"],
                                ["12"],
                                ["13"],
                                ["14"],
                                ["15"],
                                ["16"],
                                ["17"],
                                ["18"],
                                ["19"],
                                ["20"],
                                ["21"],
                                ["22"],
                                ["23"],
                                ["24"],
                                ["25"],
                                ["26"],
                                ["27"],
                                ["28"],
                                ["29"],
                                ["30"]]

class InvestmentViewController: UIViewController {

    // MARK: - Public properties
    
    // MARK: - View
    var cvProjects: UICollectionView!
    
    // MARK: - Private properties
    
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    
    private func initUI() {
        
        // navigation 返回
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
        
        // 背景
        let imgViewBackdrop = UIImageView(frame: view.bounds)
        imgViewBackdrop.image = Util.image(named: "Major_backdrop")
        view.addSubview(imgViewBackdrop)
        
        // 布局
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.itemSize = CGSize(width: cvProjectsCellWidth, height: cvProjectsCellHeight)
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.minimumInteritemSpacing = 0

        
        // CollectionView
        cvProjects = UICollectionView(frame: CGRect(x: cvProjectsX, y: cvProjectsY, width: cvProjectsWidth, height: cvProjectsHeight),
                                      collectionViewLayout: collectionViewFlowLayout)
        cvProjects.backgroundColor = .clear
        cvProjects.delegate = self
        cvProjects.dataSource = self
        cvProjects.register(InvestmentCollectionViewCell.self, forCellWithReuseIdentifier: InvestmentCellReuseIdentifier)
        cvProjects.showsHorizontalScrollIndicator = false
        
        
        view.addSubview(cvProjects)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}


// MARK: - UICollectionViewDelegate
extension InvestmentViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let content = ContentViewController()
        content.arrPicName = projPicNames[indexPath.row]
        
        navigationController?.pushViewController(content, animated: true)
    }
    
}



// MARK: - UICollectionViewDataSource
extension InvestmentViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectPicCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InvestmentCellReuseIdentifier, for: indexPath) as! InvestmentCollectionViewCell
        
        cell.imageView.image = Util.image(named: "\(projectPicPrefix)\(indexPath.row)")
        
        return cell
    }
    
}

