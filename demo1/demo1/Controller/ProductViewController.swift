import UIKit

//Product 탭 화면
final class ProductViewController: UIViewController {

    //Detail 화면으로 데이터 전달을 위한 모델 객체
    private var currentProduct : Product?
    
    private let productTableView = UITableView()
    
    //화면에 표시할 모델 객체
    let productList : [Product] = [
        Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
        Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
        Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
        Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        setUI()
    }
    
    // MARK: - 테이블 기초 설정
    func setTable() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Reused")
        productTableView.rowHeight = 94
        productTableView.backgroundColor = .systemGray6
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        //예시 앱처럼 윗부분 약간의 공백 구현
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 18))
        productTableView.tableHeaderView = header
    }
    
    // MARK: - 기초 UI(Constraint, 배경) 구현
    func setUI() {
        view.backgroundColor = .systemGray6
        self.view.addSubview(productTableView)
        
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            productTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            productTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            productTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

// MARK: - 테이블 데이터 배치 구현
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

// MARK: - 테이블 셀 선택 시 화면 전환 및 데이터 전달
extension ProductViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = ProductDetailViewController()
        
        //다음 화면의 delegate 설정 및 현재 셀의 데이터를 전달 객체에 저장
        nextVC.delegate = self
        currentProduct = productList[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

// MARK: - receiver 객체(ProductDetailView화면)에서 사용할 커스텀 프로토콜 메서드 구현
extension ProductViewController : ProductDetailViewDelegate {
    func didReceiveData() -> Product? {
        return currentProduct
    }
    
}

