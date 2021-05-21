import UIKit

class MenuTableViewCell: UITableViewCell {
    static let menuCellID = "menuCellID"
    
    private let bgView = UIView()
    
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleToFill
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let productName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = .boldSystemFont(ofSize: 50)
        priceLabel.numberOfLines = 0
        priceLabel.textAlignment = .left
        priceLabel.adjustsFontSizeToFitWidth = true
        
        return priceLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    var product: Product? {
        didSet {
            if let image = product?.icon {
                icon.image = UIImage(named: image)
            }
            if let prodName = product?.name {
                productName.text = prodName
            }
            if let descName = product?.description {
                descriptionLabel.text = descName
            }
            if let priceLbl = product?.price {
                priceLabel.text = String(priceLbl) + " \u{20B8}"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addAllUIElementsInView()
        setupConstrainst()
    }
    
    private func addAllUIElementsInView() {
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.addSubview(icon)
        bgView.addSubview(labelsStackView)
    }
    
    private func setupConstrainst() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5),
            icon.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -5),
            icon.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5),
            icon.heightAnchor.constraint(equalToConstant: 75),
            icon.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        [productName, descriptionLabel, priceLabel].forEach { labelsStackView.addArrangedSubview($0) }
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5),
            labelsStackView.trailingAnchor.constraint(equalTo: icon.leadingAnchor, constant: -10),
            labelsStackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -20),
        ])
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
