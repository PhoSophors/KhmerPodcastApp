import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNotifications()
        
        if navigationController == nil {
            print("WelcomeViewController is not embedded in a UINavigationController")
        } else {
            print("WelcomeViewController is embedded in a UINavigationController")
        }
    }

    private func setupView() {
        let welcomeView = WelcomeView()
        view.addSubview(welcomeView)
        welcomeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleLoginButtonTap), name: .handleLoginButtonTap, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRegisterButtonTap), name: .handleRegisterButtonTap, object: nil)
    }
    
    @objc private func handleLoginButtonTap() {
        print("Login button tapped in WelcomeViewController") // Debugging print
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc private func handleRegisterButtonTap() {
        print("Register button tapped in WelcomeViewController") // Debugging print
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
