import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        if navigationController == nil {
            print("WelcomeViewController is not embedded in a UINavigationController")
        } else {
            print("WelcomeViewController is embedded in a UINavigationController")
        }
    }

    private func setupView() {
        let welcomeView = WelcomeView()
        welcomeView.delegate = self
        view.addSubview(welcomeView)
        welcomeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonTapped() {
        print("Login button tapped in WelcomeViewController")
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func registerButtonTapped() {
        print("Register button tapped in WelcomeViewController")
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
}
