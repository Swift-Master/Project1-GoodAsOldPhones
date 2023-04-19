//
//  UsViewController.swift
//  GoodAsOldPhones_DEV_1
//
//  Created by 편성경 on 2023/04/19.
//

import UIKit

// Us
class UsViewController: UIViewController {

    var usTopImage: UIImage!
    @IBOutlet weak var usTopImageView: UIImageView!
    
    var emailImage: UIImage!
    @IBOutlet weak var emailImageView: UIImageView!
    
    var telImage: UIImage!
    @IBOutlet weak var telImageView: UIImageView!
    
    var urlImage: UIImage!
    @IBOutlet weak var urlImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 이미지 설정
        usTopImage = UIImage(named: "header-contact")
        usTopImageView.image = usTopImage
        
        // 하단 Contact 이미지 설정
        emailImage = UIImage(named: "icon-about-email")
        emailImageView.image = emailImage
        
        telImage = UIImage(named: "icon-about-phone")
        telImageView.image = telImage
        
        urlImage = UIImage(named: "icon-about-website")
        urlImageView.image = urlImage
        

    }

}
