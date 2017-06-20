//
//  InvestmentCollectionViewCell.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

class InvestmentCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
