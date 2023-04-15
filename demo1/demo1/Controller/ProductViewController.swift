
import UIKit

class ProductViewController: UIViewController {

    private let productTableView = UITableView()
    
    let productList : [Product] = [
        Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
        Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
        Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
        Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setTable()
        setUI()
    }
    
    func setTable() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Reused")
        productTableView.rowHeight = 94
        productTableView.backgroundColor = .systemGray6
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 18))
        productTableView.tableHeaderView = header
    }
    
    func setUI() {
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(productTableView)
        
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            productTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            productTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }

}

extension ProductViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Reused", for: indexPath) as! CustomTableViewCell
        cell.productName.text = productList[indexPath.row].name ?? "nonamed"
        cell.productImage.image = UIImage(named: productList[indexPath.row].cellImageName ?? "star")

        return cell
    }
    
    
}

extension ProductViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.navigationController?.pushViewController(ProductDetailViewController(), animated: true)
    }

}
