//
//  Extension.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/16.
//  Copyright © 2017年 Junes. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    var ly_x: CGFloat {
        get {
            return frame.origin.x
        }
    }
    
    var ly_y: CGFloat {
        get {
            return frame.origin.y
        }
    }
    
    var ly_width: CGFloat {
        get {
            return frame.size.width
        }
    }
    
    
    var ly_height: CGFloat {
        get {
            return frame.size.height
        }
    }
    
    var ly_bottom: CGFloat {
        get {
            return ly_y + ly_height
        }
    }
}
