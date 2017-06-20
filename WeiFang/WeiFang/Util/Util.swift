//
//  Util.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/16.
//  Copyright © 2017年 Junes. All rights reserved.
//

import Foundation
import UIKit






func LyPrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        print(items, separator: separator, terminator: terminator)
    #endif
}




class Util: NSObject {
    
    
    public let shared = Util()
    
    
    private static var bundlePath: String!

    
    private override init() {
        super.init()
    }
    
    
    
    // MARK: - Public Methods
    class func image(named name: String) -> UIImage? {
        guard let path = imagePath(named: name) else {
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    

    class func font(size: CGFloat, name: String = ".SFUIDisplay") -> UIFont? {
        return UIFont(name: name, size: size)
    }
    
    
    
    // MARK: - Private Methods
    private class func imagePath(named name: String) -> String? {
        if nil == bundlePath {
            bundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle")
        }
        return bundlePath + "/images/\(name)"
    }
    
    
    
}

