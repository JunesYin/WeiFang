//
//  ContentCollectionViewCell.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    // MARK: - View
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
    }
    
}
