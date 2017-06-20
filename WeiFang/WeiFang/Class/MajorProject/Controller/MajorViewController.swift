//
//  MajorViewController.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/16.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

fileprivate let cvProjectsX: CGFloat = HorizontalMarginLeft * (SCREEN_WIDTH / DEFAULT_WIDTH)
fileprivate let cvProjectsY: CGFloat = VerticalMarginTopLarge * (SCREEN_HEIGHT / DEFAULT_HEIGHT)
fileprivate let cvProjectsWidth: CGFloat = SCREEN_WIDTH * ((DEFAULT_WIDTH - HorizontalMarginLeft - HorizontalMarginLeft) / DEFAULT_WIDTH)
fileprivate let cvProjectsHeight: CGFloat = SCREEN_HEIGHT * ((DEFAULT_HEIGHT - VerticalMarginTopLarge - VerticalMarginBottomLarge) / DEFAULT_HEIGHT)
fileprivate let cvProjectsCellWidth: CGFloat = cvProjectsHeight * (7.0 / 10.0)
fileprivate let cvProjectsCellHeight: CGFloat = cvProjectsCellWidth
fileprivate let cvProjectsCellReuseIdentifier = "cvProjectsCellReuseIdentifier"
fileprivate let arrProjects = ["区域优势", "交通优势", "资源优势", "政策优势", "招商项目"]

fileprivate let arrProjPicNames = [["RegionalAdvantages"],
                       ["TrafficAdvantages"],
                       ["ResourceAdvantages_0", "ResourceAdvantages_1", "ResourceAdvantages_2"],
                       ["PoliticalAdvantages_0", "PoliticalAdvantages_1", "PoliticalAdvantages_2", "PoliticalAdvantages_3"],
                       []]

class MajorViewController: UIViewController {

    // MARK: - View
    var cvProjects: UICollectionView!
    
    // MARK: - Constant
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initUI()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 显示navigationBar
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func initUI() {
        
        // navigation 返回
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
        
        // 背景
        let imgViewBackdrop = UIImageView(frame: view.bounds)
        imgViewBackdrop.image = Util.image(named: "Major_backdrop")
        view.addSubview(imgViewBackdrop)
        
        // 布局
        let collectionViewFlowLayout = LyLinearCollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: cvProjectsCellWidth, height: cvProjectsCellHeight)
        collectionViewFlowLayout.minimumLineSpacing = 0
        
        // CollectionView
        cvProjects = UICollectionView(frame: CGRect(x: cvProjectsX, y: cvProjectsY, width: cvProjectsWidth, height: cvProjectsHeight),
                                      collectionViewLayout: collectionViewFlowLayout)
        cvProjects.backgroundColor = .clear
        cvProjects.delegate = self
        cvProjects.dataSource = self
        cvProjects.register(MjorCollectionViewCell.self, forCellWithReuseIdentifier: cvProjectsCellReuseIdentifier)
        cvProjects.showsHorizontalScrollIndicator = false
        
        
        view.addSubview(cvProjects)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    
    

}


// MARK: - UICollectionViewDelegate
extension MajorViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let index = collectionView.contentOffset.x / cvProjectsCellWidth + 0.2
        LyPrint(index)
        
        if indexPath.row == Int(index) {
            return true
        }
        
        return false
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if 4 == indexPath.row {
            let investment = InvestmentViewController()
            navigationController?.pushViewController(investment, animated: true)
            
        } else {
            let content = ContentViewController()
            content.arrPicName = arrProjPicNames[indexPath.row]
        
            navigationController?.pushViewController(content, animated: true)
        }
    }
    
}



// MARK: - UICollectionViewDataSource
extension MajorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cvProjectsCellReuseIdentifier, for: indexPath) as! MjorCollectionViewCell
        
        cell.imageView.image = Util.image(named: "Major_cell")
        cell.textLabel.text = arrProjects[indexPath.row]
        
        return cell
    }
    
}





