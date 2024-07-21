import UIKit
import SnapKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped()
    func registerButtonTapped()
}

class WelcomeView: UIView {

    weak var delegate: WelcomeViewDelegate?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover Your\nFavorites Podcast here"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore a wide range of podcasts tailored to your interests."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(loginButton)
        contentView.addSubview(registerButton)
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        headerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(350)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(headerImageView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(registerButton.snp.leading).offset(-10)
            make.height.equalTo(50)
            make.width.equalTo(registerButton)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        print("Login button tapped in WelcomeView")
        delegate?.loginButtonTapped()
    }
    
    @objc private func registerButtonTapped() {
        print("Register button tapped in WelcomeView")
        delegate?.registerButtonTapped()
    }
}
