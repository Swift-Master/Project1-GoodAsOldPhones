import UIKit

final class ContactViewController: UIViewController {
    
    lazy var titleLabel = createdLabel("About Us",.boldSystemFont(ofSize: 24))
    
    lazy var introduction1 = createdLabel("Good as Old Phones returns the phones of  yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:",.systemFont(ofSize: 14))
    
    lazy var introduction2 = createdLabel("Whether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected.",.systemFont(ofSize: 14))
    
    lazy var postScript = createdLabel("*Hands-free phones available",.italicSystemFont(ofSize: 13))
    
    lazy var contactLabel = createdLabel("Contact",.boldSystemFont(ofSize: 24))
    
    lazy var contactEmail = createdLabel("good-as-old@example.com",.systemFont(ofSize: 13))
    
    lazy var contactPhone = createdLabel("412-888-9028",.systemFont(ofSize: 13))
    
    lazy var contactWebsite = createdLabel("www.example.com",.systemFont(ofSize: 13))
    
    lazy var headerImageView = createdImageView("header-contact")
    
    lazy var contactEmailImageView = createdImageView("icon-about-email")
    
    lazy var contactPhoneImageView = createdImageView("icon-about-phone")
    
    lazy var contactWebsiteImageView = createdImageView("icon-about-website")
    
    lazy var superStackView = createdVstack([titleLabel,introStackView,contactLabel,contactStackView])
    
    lazy var introStackView = createdVstack([introduction1,introduction2,postScript])
    
    lazy var contactStackView = createdVstack([emailStackView,phoneStackView,websiteStackView])
    
    lazy var emailStackView =  createdHstack([contactEmailImageView,contactEmail])
    lazy var phoneStackView =  createdHstack([contactPhoneImageView,contactPhone])
    lazy var websiteStackView =  createdHstack([contactWebsiteImageView,contactWebsite])
    
    let contentView = {
        let set = UIView()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.backgroundColor = .clear
        return set
    }()
    
    lazy var scrollView = {
        lazy var set = UIScrollView(frame: self.view.bounds)
        set.translatesAutoresizingMaskIntoConstraints = false
        set.backgroundColor = .clear
        set.alwaysBounceVertical = true
        set.bounces = true
        return set
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setUI()
    }
    
    func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [headerImageView,superStackView].forEach{scrollView.addSubview($0)}
        headerImageView.contentMode = .scaleAspectFill
        contactLabel.textAlignment = .center
        titleLabel.textAlignment = .center
        introduction1.numberOfLines = 5
        introduction2.numberOfLines = 5
        introStackView.spacing = 27
        contactStackView.spacing = 27
        superStackView.spacing = 30
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),



            headerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 125),

            superStackView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 30),
            superStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            superStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -30)
        ])

    }

    
    func createdLabel(_ text : String, _ font : UIFont) -> UILabel {
        let set = UILabel()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.font = font
        set.text = text
        set.textAlignment = .left
        set.baselineAdjustment = .alignBaselines
        set.adjustsFontSizeToFitWidth = true
        return set
    }
    
    func createdImageView(_ imageName : String) -> UIImageView {
        let set = UIImageView()
        set.translatesAutoresizingMaskIntoConstraints = false
        set.image = UIImage(named: imageName)
        set.contentMode = .scaleAspectFit
        return set
    }
    
    func createdVstack(_ subViews : [UIView]) -> UIStackView {
        lazy var set = UIStackView(arrangedSubviews: subViews)
        set.translatesAutoresizingMaskIntoConstraints = false
        set.axis = .vertical
        set.alignment = .fill
        set.distribution = .fill
        return set
    }
    
    func createdHstack(_ subViews : [UIView]) -> UIStackView {
        lazy var set = UIStackView(arrangedSubviews: subViews)
        set.translatesAutoresizingMaskIntoConstraints = false
        set.axis = .horizontal
        set.spacing = 23
        set.distribution = .fillProportionally
        set.alignment = .leading
        return set
    }
    
}

