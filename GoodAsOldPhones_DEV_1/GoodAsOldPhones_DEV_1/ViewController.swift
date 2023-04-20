//
//  ViewController.swift
//  GoodAsOldPhones_DEV_1
//
//  Created by 편성경 on 2023/04/19.
//

import UIKit

// Products
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // 상세 화면 이동 버튼
    @IBAction func goDetail(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

