//
//  ViewController.swift
//  GoodAsOldPhones_DEV_1
//
//  Created by 편성경 on 2023/04/19.
//

import UIKit

// Products
class ViewController: UIViewController {

    @IBOutlet weak var productsTableView: UITableView!
    
    var productsItem = ["1907 Wall Set", "1921 Dial Phone", "1937 Desk Set", "1984 Moto Porable"]
    let cellImage = ["image-cell1", "image-cell2", "image-cell3", "image-cell4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsTableView.dataSource = self
        productsTableView.delegate = self
    }
}

// Cell Class 따로 생성하지 않음 !
class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // cell의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsItem.count
    }
    
    // 표시할 cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productsCell = productsTableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
        productsCell.cellImageView.image = UIImage(named: cellImage[indexPath.row])
        productsCell.cellLabel.text = productsItem[indexPath.row]
        
        return productsCell
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // cell 선택 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        detailVC.selectRow = indexPath.row // 선택한 index 전달
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


