//
//  ViewController.swift
//  WeiFang
//
//  Created by wJunes on 2017/6/19.
//  Copyright © 2017年 Junes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // navigation 透明
        navigationController?.navigationBar.setBackgroundImage(Util.image(named: "NavigationBar_tranparent"), for: .default)
        // navigation 返回
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .done, target: nil, action: nil)
        
        // 修改btnEnter约束
        for constraint in view.constraints {
            guard .top == constraint.firstAttribute && 2 == constraint.firstItem.tag else { continue }
            
            constraint.constant = view.ly_height * 3.0 / 5.0
            break
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 隐藏navigationBar
        navigationController?.navigationBar.isHidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func takeEnterFrom(_ sender: UIButton) {
        let major = MajorViewController()
        navigationController?.pushViewController(major, animated: true)
    }

}

