//
//  DetailViewController.swift
//  GoodAsOldPhones_DEV_1
//
//  Created by 편성경 on 2023/04/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectRow: Int! // 전달받은 index

    @IBOutlet weak var addToCartImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    let backgroundImage = ["phone-fullscreen1", "phone-fullscreen2", "phone-fullscreen3", "phone-fullscreen4"]
    
    @IBOutlet weak var titleLabel: UILabel!
    var titleStr = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Moto Porable"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addToCart 기본 설정
        addToCartImageView.image = UIImage(named: "button-addtocart")
        
        // 전달받은 index로 배경 이미지, 상단 title 설정
        backgroundImageView.image = UIImage(named: backgroundImage[selectRow])
        titleLabel.text = titleStr[selectRow]
    }

}
