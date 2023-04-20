//
//  UsViewController.swift
//  GoodAsOldPhones_DEV_1
//
//  Created by 편성경 on 2023/04/19.
//

import UIKit

// Us
class UsViewController: UIViewController {

    // 상단 이미지
    @IBOutlet weak var usTopImageView: UIImageView!
    
    // 하단 이미지
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var telImageView: UIImageView!
    @IBOutlet weak var urlImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 이미지 설정
        usTopImageView.image = UIImage(named: "header-contact")
        
        // 하단 Contact 이미지 설정
        emailImageView.image = UIImage(named: "icon-about-email")
        telImageView.image = UIImage(named: "icon-about-phone")
        urlImageView.image = UIImage(named: "icon-about-website")
        
    }

}
