import UIKit

protocol ProductDetailViewDelegate : AnyObject {
    
    func didReceiveData() -> Product?
}

final class ProductDetailViewController: UIViewController {
     
    var delegate : ProductDetailViewDelegate?
    
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
    
    func setUI() {
        self.view.backgroundColor = .white
        if let product = getProduct() {
            
            productNameLabel.text = product.name
            
            if let backgroundImage = UIImage(named: product.fullscreenImageName ?? "star") {
                backgroundImageView.image = backgroundImage
            }
        }
        
    }
    
    func setConstraint() {
        [productNameLabel,purchaseButton,backgroundImageView].forEach{self.view.addSubview($0)}
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
    
    func getProduct() -> Product? {
        return delegate?.didReceiveData()
    }
    
    @objc func addToCart() {
        print("Add to cart successfully")
    }
}


