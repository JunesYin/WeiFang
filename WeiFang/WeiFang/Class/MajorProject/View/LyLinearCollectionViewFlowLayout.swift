//
//  LyLinearCollectionViewFlowLayout.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/16.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

class LyLinearCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        
        // 水平滚动
        scrollDirection = .horizontal
        let inset = ((collectionView?.ly_width)! - itemSize.width) * 0.5
        sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // 获得super已计算好的布局属性
        var array: [UICollectionViewLayoutAttributes]? = nil
        if let originArray = super.layoutAttributesForElements(in: rect) {
            array = NSArray(array: originArray, copyItems: true) as? [UICollectionViewLayoutAttributes]
        }

        // 计算collectionView最中心的X值
        let centerX = (collectionView?.contentOffset.x)! + (collectionView?.ly_width)! * 0.5
        
        // 在原有布局牛性的基础上，进行微调
        for attrs in array! {
            // cell的中心点x 与collectionView最中心点x 的间距
            let delta = abs(attrs.center.x - centerX)
            
            // 根据间距值计算cell的缩放比例
            let scale = 1 - delta / (collectionView?.ly_width)!
            
            // 设置缩放比例
            attrs.transform = attrs.transform.scaledBy(x: scale, y: scale)
        }
        
        return array
    }
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        // 计算出最终显示的矩形框
        var rect = CGRect.zero
        rect.origin.y = 0
        rect.origin.x = proposedContentOffset.x
        rect.size = (collectionView?.frame.size)!
        
        // 获得super已经计算好的布局性性
        let array = super.layoutAttributesForElements(in: rect)
        
        // 计算collectionView最中心的x值
        let centerX = proposedContentOffset.x + (collectionView?.ly_width)! * 0.5
        
        // 存放最小的间距值
        var minDelta = CGFloat.greatestFiniteMagnitude
        for attrs in array! {
            if abs(minDelta) > abs(attrs.center.x - centerX) {
                minDelta = attrs.center.x - centerX
            }
        }
        
        // 修改原有的偏移量
        let rltPoint = CGPoint(x: proposedContentOffset.x + minDelta, y: proposedContentOffset.y)
        
        return rltPoint
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
