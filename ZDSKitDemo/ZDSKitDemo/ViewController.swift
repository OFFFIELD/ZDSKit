//
//  ViewController.swift
//  ZDSKitDemo
//
//  Created by Da on 2023/2/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = ZDSPlaceholderBar()
        v.frame = CGRect(x: 0, y: 100, width: .screenWidth, height: 20)
        view.addSubview(v)
    }

}

