import UIKit

// MARK: - 데이터 수신을 위한 커스텀 프로토콜 정의
protocol ProductDetailViewDelegate : AnyObject {
    
    func didReceiveData() -> Product?
}

final class ProductDetailViewController: UIViewController {
    
    // delegate 패턴을 위한 프로토콜 타입의 변수 선언
    var delegate : ProductDetailViewDelegate?
    
    
    // MARK: - 화면 객체들 선언
    lazy var productNameLabel = {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.font = .boldSystemFont(ofSize: 24.0)
        set.textAlignment = .center
        return set
    }()
    
    lazy var purchaseButton = {
       let set = UIButton()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.setBackgroundImage(UIImage(named: "button-addtocart"), for: .normal)
        set.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return set
    }()
    
    lazy var backgroundImageView = {
        let set = UIImageView(frame: self.view.bounds)
        set.contentMode = .scaleAspectFill
        return set
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraint()
    }
    
    // MARK: - 이전 뷰의 데이터를 받아 저장하고 배경을 설정합니다.
    func setUI() {
        if let product = getProduct() {
            
            productNameLabel.text = product.name
            
            if let backgroundImage = UIImage(named: product.fullscreenImageName ?? "star") {
                backgroundImageView.image = backgroundImage
            }
        }
        
    }
    
    // MARK: - 화면 레이아웃을 설정합니다
    func setConstraint() {
        [productNameLabel,purchaseButton,backgroundImageView].forEach{self.view.addSubview($0)}
        //배경이미지가 가장 모든 뷰 중 가장 뒤로 가도록 합니다.
        view.sendSubviewToBack(backgroundImageView)
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            productNameLabel.heightAnchor.constraint(equalToConstant: 38),
            productNameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            productNameLabel.widthAnchor.constraint(equalToConstant: 335),
            
            
            purchaseButton.topAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: 48),
            purchaseButton.heightAnchor.constraint(equalToConstant: 41),
            purchaseButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 92),
            purchaseButton.widthAnchor.constraint(equalToConstant: 158)
        ])
    }
    
    // MARK: - 프로토콜 메서드를 통해 데이터를 가져옵니다.
    func getProduct() -> Product? {
        return delegate?.didReceiveData()
    }
    
    // MARK: - 버튼을 눌렀을 때 실행되는 메서드입니다.
    @objc func addToCart() {
        print("Add to cart successfully")
    }
}


