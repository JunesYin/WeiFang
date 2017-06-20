//
//  MjorCollectionViewCell.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

class MjorCollectionViewCell: UICollectionViewCell {
    
    // MARK: - View
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height * 8.0 / 10.0))
        textLabel.font = Util.font(size: 34)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        addSubview(textLabel)
        
    }
    
    
}
