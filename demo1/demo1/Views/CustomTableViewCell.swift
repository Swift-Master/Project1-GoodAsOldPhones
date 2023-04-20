import UIKit


final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - UI 객체 선언부
    lazy var productImage : UIImageView = {
        let configuration = UIImageView()
        configuration.translatesAutoresizingMaskIntoConstraints = false
        configuration.contentMode = .scaleAspectFit
        return configuration
    }()
    
    let productName : UILabel = {
        let configuration = UILabel()
        configuration.translatesAutoresizingMaskIntoConstraints = false
        return configuration
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator //네비게이션을 위한 악세사리 설정
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI 설정
    func setUI() {
        [productImage,productName].forEach {self.contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            productImage.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor,constant: 8),
            productImage.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            productImage.widthAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.heightAnchor),
            
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10),
            productName.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor),
            productName.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor),
            productName.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
