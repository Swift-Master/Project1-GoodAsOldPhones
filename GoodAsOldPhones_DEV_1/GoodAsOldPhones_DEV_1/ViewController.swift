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
        productsTableView.rowHeight = 100
    }

    // 상세 화면 이동 버튼 TEST
    /*
    @IBAction func goDetail(_ sender: UIButton) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
     */
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productsCell = productsTableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
        productsCell.cellImageView.image = UIImage(named: cellImage[indexPath.row])
        productsCell.cellLabel.text = productsItem[indexPath.row]
        
        return productsCell
    }
    
}


